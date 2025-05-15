import { isFunction } from "lodash-es";

/**
 *
 * @param {*} delay
 * @param {*} callback
 * @returns
 */
export function sleep(delay, callback = "") {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(isFunction(callback) ? callback() : callback);
    }, delay);
  });
}

/**
 * @param {*} url
 * @param {*} options
 * @param {*} timeout
 * @returns
 */
export function fetchWithTimeout(url = "https://jsonplaceholder.typicode.com/posts", options = {}, timeout = 3000) {
  return new Promise((resolve, reject) => {
    const controller = new AbortController();
    const timer = setTimeout(() => {
      controller.abort(); // 中止请求
      reject(new Error("请求超时"));
    }, timeout);

    fetch(url, {
      ...options,
      signal: controller.signal
    })
      .then((response) => {
        clearTimeout(timer);
        resolve(response);
      })
      .catch((error) => {
        clearTimeout(timer);
        reject(error);
      });
  });
}
