function debounce(func, delay, immediate = false) {
  let timer = null;

  const debounced = function (...args) {
    const context = this;
    clearTimeout(timer);

    if (immediate) {
      const callNow = !timer;
      timer = setTimeout(() => {
        timer = null;
      }, delay);

      if (callNow) {
        func.apply(context, args);
      }
    } else {
      timer = setTimeout(() => {
        func.apply(context, args);
      }, delay);
    }
  };

  // 添加取消方法
  debounced.cancel = function () {
    clearTimeout(timer);
    timer = null;
  };

  return debounced;
}

function throttle(func, delay, options = {}) {
  let timer = null;
  let previous = 0; // 上次执行的时间点

  // 解构配置项，leading表示是否立即执行，trailing表示是否在结束后执行
  const { leading = true, trailing = true } = options;

  const throttled = function (...args) {
    const now = Date.now();
    const context = this;

    // 如果是第一次调用且leading为false，则将上次执行时间设为当前时间
    if (!previous && leading === false) {
      previous = now;
    }

    const remaining = delay - (now - previous);

    if (remaining <= 0 || remaining > delay) {
      if (timer) {
        clearTimeout(timer);
        timer = null;
      }
      previous = now;
      func.apply(context, args);
    } else if (!timer && trailing) {
      timer = setTimeout(() => {
        previous = leading ? Date.now() : 0;
        timer = null;
        func.apply(context, args);
      }, remaining);
    }
  };

  // 添加取消方法
  throttled.cancel = function () {
    clearTimeout(timer);
    timer = null;
    previous = 0;
  };

  return throttled;
}
