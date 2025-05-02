function throttle(fn, delay, options = { leading: true, trailing: true }) {
	let timer = null;
	let previous = 0;
	const { leading, trailing } = options;

	return function (...args) {
		const context = this;
		const now = Date.now();

		if (!leading && !previous) {
			previous = now;
		}

		const remaining = delay - (now - previous);
		if (remaining <= 0) {
			if (timer) {
				clearTimeout(timer);
				timer = null;
			}
			previous = now;
			fn.apply(context, args);
		} else if (!timer && trailing) {
			timer = setTimeout(() => {
				previous = leading ? Date.now() : 0;
				timer = null;
				fn.apply(context, args);
			}, remaining);
		}
	};
}
