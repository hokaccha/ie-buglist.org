テキスト入力フォームの幅が文字入力時に変化する

### 現象

`<input type="text">`、`<input type="password">`およびtextarea要素が以下の条件を満たすとき、入力領域に何らかの文字を入力した時にその幅が広がる。

* input, textarea要素のwidthプロパティを%単位の値で指定している。
* （input要素のみ）line-heightプロパティにnormal, inherit以外の値を指定している。
* input, textarea要素の祖先要素に左マージンや左パディングを指定したものがある（body要素を除く）。
