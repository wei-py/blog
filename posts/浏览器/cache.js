export async function fetchResource(url, options = {}) {
  const request = new Request(url, options);

  // 1️⃣ 检查 Memory Cache（内存缓存）
  const memoryCacheHit = memoryCache.get(request);
  if (memoryCacheHit) {
    console.log("✅ Hit Memory Cache (from memory cache)");
    return memoryCacheHit;
  }

  // 2️⃣ 检查 Service Worker Cache（如果注册了 SW）
  if (navigator.serviceWorker.controller) {
    try {
      const swResponse = await fetchFromServiceWorker(request);
      if (swResponse) {
        console.log("✅ Hit Service Worker Cache (from ServiceWorker)");
        // 注意：SW 可能返回缓存，也可能转发到网络
        return swResponse;
      }
    }
    catch (err) {
      console.warn("Service Worker error, falling back to network/cache");
    }
  }

  // 3️⃣ 检查 HTTP Cache（强缓存 + 协商缓存）
  const httpCacheEntry = httpCache.get(request);

  if (httpCacheEntry) {
    const { response, metadata } = httpCacheEntry;

    // 🔒 强缓存检查：Cache-Control / Expires
    if (isStrongCacheValid(metadata)) {
      console.log("✅ Hit HTTP Strong Cache (200 from disk/memory cache)");
      return response;
    }

    // 🤝 协商缓存：准备条件请求头
    const conditionalHeaders = {};
    if (metadata.etag) {
      conditionalHeaders["If-None-Match"] = metadata.etag;
    }
    else if (metadata.lastModified) {
      conditionalHeaders["If-Modified-Since"] = metadata.lastModified;
    }

    const conditionalRequest = new Request(request, {
      headers: { ...request.headers, ...conditionalHeaders },
    });

    // 发起协商请求（实际网络请求）
    const serverResponse = await actualNetworkFetch(conditionalRequest);

    if (serverResponse.status === 304) {
      console.log("✅ Hit HTTP Revalidation Cache (304 Not Modified)");
      // 更新缓存元数据（如 max-age 重置）
      httpCache.updateMetadata(request, serverResponse.headers);
      return response; // 返回旧缓存体
    }
    else {
      console.log("🔄 HTTP Cache Miss – updating with new response");
      // 存入 HTTP 缓存（根据 Cache-Control 决定是否缓存）
      httpCache.put(request, serverResponse);
      return serverResponse;
    }
  }

  // 4️⃣ 检查 Push Cache（仅当其他缓存都未命中，且处于同一 HTTP/2 连接）
  const pushCacheHit = pushCache.get(request, currentHttp2Connection);
  if (pushCacheHit && !pushCacheHit.consumed) {
    console.log("✅ Hit Push Cache");
    pushCacheHit.consumed = true; // Push Cache 是一次性消费
    // 注意：Push Cache 命中后，通常还会经过 HTTP Cache（用于持久化）
    if (shouldCachePushedResponse(pushCacheHit)) {
      httpCache.put(request, pushCacheHit);
    }
    return pushCacheHit;
  }

  // 5️⃣ 最终：发起真实网络请求
  console.log("🌐 No cache hit – fetching from network");
  const freshResponse = await actualNetworkFetch(request);

  // 根据响应头决定是否存入 HTTP 缓存
  if (isCacheable(freshResponse)) {
    httpCache.put(request, freshResponse);
  }

  return freshResponse;
}

// ———————— 辅助函数 ————————

function isStrongCacheValid(metadata) {
  if (metadata.cacheControl === "no-store")
    return false;
  if (metadata.cacheControl === "no-cache")
    return false;

  const now = Date.now();
  if (metadata.maxAge) {
    return now < metadata.storedTime + metadata.maxAge * 1000;
  }
  if (metadata.expires) {
    return now < new Date(metadata.expires).getTime();
  }
  return false;
}

function isCacheable(response) {
  const cc = response.headers.get("Cache-Control") || "";
  return !cc.includes("no-store") && (
    cc.includes("max-age")
    || response.headers.has("Expires")
  );
}

function shouldCachePushedResponse(response) {
  // Pushed 资源只有在浏览器实际“请求”它时，才会进入 HTTP 缓存
  // 伪代码中我们假设：只要响应有 max-age，就缓存
  return isCacheable(response);
}

// 模拟从 Service Worker 获取（实际由 SW 的 fetch 事件处理）
async function fetchFromServiceWorker(request) {
  // 实际由 SW 控制：可能返回缓存、网络、或组合
  // 这里简化为：调用 SW 的逻辑（伪实现）
  return await serviceWorkerFetchHandler(request);
}

// 模拟真实网络请求（绕过所有缓存）
async function actualNetworkFetch(request) {
  // 实际发送 HTTP 请求
  return await nativeFetch(request, { cache: "no-store" });
}
