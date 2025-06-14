/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number[]}
 */
var maxSlidingWindow = function (nums, k) {
  let st = [0];
  let tt = [];
  const result = [];

  for (let i = 1; i < nums.length; i++) {
    if (nums[tt.at(-1)] < nums[i]) {
      tt.push(i);
    }

    st.push(i);

    if (nums[st[0]] <= nums[i]) {
      st = [i];
      tt = [i];
    }


    if (st.length > k) {
      // if (i - tt.at(-1) === k) {
      //   tt = [i];
      // }
      st = tt.length ? tt : [i];
    }

    result.push(nums[st[0]]);
  }

  return result.slice(k - 2);
};

// const nums = [1, 3, -1, -3, 5, 3, 6, 7];
const k = 3;
// const nums = [1, -1];
// const k = 1;
// const nums = [7, 2, 4];
// const k = 2;
const nums = [1, 3, 1, 2, 0, 5]
const result = maxSlidingWindow(nums, k)
console.log(result)