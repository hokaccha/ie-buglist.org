幅や高さを指定した要素内にあるfloatの下マージンが無視される

### 現象

WinIEは幅や高さを指定した要素はボックスサイズの算出時に内部のフロートを除外しなくなる（WinIEバグ053）が、このときフロートの下マージンが無視されてしまう。
