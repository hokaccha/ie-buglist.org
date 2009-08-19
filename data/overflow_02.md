overflow:scroll;等が指定された要素の背景画像が閲覧領域に対して固定されない

### 現象

overflowプロパティにscrollやautoが指定された要素の背景画像を固定した（background-attachment: fixed;）とき、背景の基準位置が閲覧領域左上端ではなく当該要素の左上端になる（html, body要素を除く）。
