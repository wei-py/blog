- NodeList

  - SideNodeListFilter client (render函数过滤，无法序列化)
    - NodeItem
      - content
      - header (使用了 dayjs)

- NodeList

  - SideNodeListFilter client (使用react.Children.map(children, (child, index) => {}))
    - NodeItem
      - content
      - header

- NodeList
  - SideNodeListFilter client (使用props)
    - NodeItem
      - content
      - header

服务端 (Server)
│
├── 1. 执行 SidebarNoteList (服务端组件)
│ ├── 调用 getAllNotes() -> 获取数据
│ ├── 调用 <SidebarNoteItemHeader /> -> 执行 dayjs -> 得到 "2023年10月27日"
│ └── 构造对象: { header: [已渲染的HTML片段, 包含"2023年10月27日"] }
│
├── 2. 将包含"成品"header的notes数组作为props传递
│
↓
传输 (传输的是数据和静态HTML，不是dayjs代码)
│
↓
客户端 (Client)
│
└── 3. 执行 SidebarNoteListFilter (客户端组件)
├── 从URL获取搜索词
├── 进行字符串过滤 (不需要dayjs)
└── 直接显示已有的header HTML -> "2023年10月27日"
