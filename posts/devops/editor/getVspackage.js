const url = "https://marketplace.visualstudio.com/items?itemName=BrandonKirbyson.vscode-animations";
const version = "2.0.7";

// 从 URL 中提取 itemName
const itemName = new URL(url).searchParams.get("itemName");

// 将 itemName 分解为 publisher 和 extension name
const [fieldA, fieldB] = itemName.split(".");

// 构造 API URL
const apiUrl = `https://marketplace.visualstudio.com/_apis/public/gallery/publishers/${fieldA}/vsextensions/${fieldB}/${version}/vspackage`;
apiUrl.toLocaleLowerCase();
