トップページ

## ボックスモデル

### maring,padding,border,width,heigthの複合

* [ボックスの幅や高さを算出するときにpaddingやborderのサイズを含めてしまう](/view/box_01)
* [左右borderとpaddingを設置した要素に後続する部分がずれる](/view/box_02)
* [マージンに負数が指定された要素でボーダーがずれてゆく](/view/box_03)
* [親要素からはみ出した子孫要素の一部が消える](/view/box_04)
* [インライン要素に指定したパディングやボーダーの上下が消える](/view/box_05)
* [幅や高さを指定した要素でdoubleボーダー領域に背景が描画されない](/view/box_06)
* [ボックスサイズが内容物に合わせた大きさへ強制的に調整される](/view/box_07)
* [親にボーダーを設置した要素を持つ要素のマージン設置が正しくない](/view/box_08)
* [幅や高さを指定した要素の子孫要素でデフォルト指定のマージンが消える](/view/box_09)

### width,height

* [初期コンテナブロックを生成する要素の幅を指定できない](/view/width_height_01)
* [ボックスの高さを特定の値より小さくできない](/view/width_height_02)

### border

* [一部のボーダーはcolorの値を引き継がない](/view/border_01)
* [border-colorにtransparentを指定すると前景色で表示される](/view/border_02)


## 視覚整形モデル

### float

* [背景色が指定された要素内にfloatがあるときに要素内の文字が消える](/view/float_01)
* [幅や高さを指定した要素ではボックスサイズの算出時にfloatを除外しない](/view/float_02)
* [floatに後続するボックスの幅がfloatに合わせて短縮される](/view/float_03)
* [先行するfloatの上方に後続のfloatが置かれる](/view/float_04)
* [幅や高さを指定した要素内にあるfloatの下マージンが無視される](/view/float_05)
* [floatの左右マージンが指定値より大きくなる](/view/float_06)
* [インライン要素に挟まれているfloatが下にずれて置かれる](/view/float_07)
* [floatの上部に祖先要素の上ボーダーを表示する](/view/float_08)
* [clearを指定した要素ではfloatに対して上マージンを設置する](/view/float_09)
* [clearを指定したfloatの上下に空行ができる](/view/float_10)
* [floatを含むボックスのマージンが無視される](/view/float_11)
* [floatの左右にある行の端がずれる](/view/float_12)
* [親要素のボックスからはみ出すボックスがfloatの下に置かれる](/view/float_13)
* [コメントがfloatの位置をずらす](/view/float_14)
* [p要素などをfloatにすると上マージンが消える](/view/float_15)
* [floatに隣接する要素は親要素との間で上下マージンが相殺されない](/view/float_16)

### clear

* [clearを指定したボックスの内側上部に隙間が空く](/view/clear_01)
* [clearの指定が親要素にも影響する](/view/clear_02)

### position

* [left, topが指定された要素ではright, bottomを認識しない](/view/position_01)
* [line-heightが指定された相対配置要素の上ボーダー上端が消える](/view/position_02)
* [相対配置した要素へ向かうリンクのジャンプ先が移動前の位置になる](/view/position_03)
* [直後に背景色つきのhr要素がある絶対配置要素の初期位置がずれている](/view/position_04)

### display

* [ブロック化したアンカーの範囲が内容物の部分のみになる](/view/display_01)
* [head要素と子孫要素のdisplayプロパティを変更できない](/view/display_02)
* [ルビ関連要素のdisplayプロパティを変更できない](/view/display_03)

## フォント、テキスト

### line-height

* [全体にline-heightが指定されたページの最上部が消える](/view/line_height_01)
* [line-heightで算出した行高を超える部分が表示されない](/view/line_height_02)
* [非置換インライン要素に対するline-heightの指定を無視する](/view/line_height_03)

### letter-spacing

* [letter-spacingを指定した要素内で連続したbr要素が無視される](/view/letter_spacing_01)

### font

* [font-familyを指定した要素で文字化けする](/view/font_01)
* [em単位で指定した値が文字サイズ変更後に正しく反映されない](/view/font_02)
* [見出し要素でfont-sizeを算出する際に親要素の値を参照しない](/view/font_03)
* [em単位で指定した字間をbody要素の文字サイズを基準に算出する](/view/font_04)
* [OpenTypeフォントを用いて2バイト文字を表示することができない](/view/font_05)

### vertical-align

* [line-heightが指定された要素内でvertical-alignの%値指定が正しく反映されない](/view/vertical_align_01)
* [擬似要素にvertical-alignプロパティが効かない](/view/vertical_align_02)
* [vertical-alignが指定された要素を含む行が前後の行に重なる](/view/vertical_align_03)
* [vertical-align:middle;の状態では置換インライン要素だけの行の高さ算出が不正](/view/vertical_align_04)
* [最も高さが大きい要素にvertical-align:bottom;を指定すると配置が狂う](/view/vertical_align_05)

### white-space

* [white-space:nowrap;を指定した要素の内部が表示されない](/view/white_space_01)

### text-decoration

* [親要素のtext-decorationの効果を子要素で解除できる](/view/text_decoration_01)

### background

* [インライン要素のrepeat-x背景画像が1行目にしか表示されない](/view/background_01)

## リスト、表

### li

* [ブロックボックス化した要素を含むリストアイテムの後ろに空行が入る](/view/list_01)
* [幅が指定されたリスト要素のマージンが正しく反映されない](/view/list_02)
* [絶対配置／float状態のリストアイテム要素のリストマーカーが消える](/view/list_03)
* [先頭にfloatがあるリストアイテム要素でリストマーカーが要素内に入り込む](/view/list_04)
* [パディング・幅・高さを指定したリストでリストマーカーが壊れる](/view/list_05)
* [リストマーカーの番号が途中から振られる](/view/list_06)
* [li要素でvertical-alignがテキストの配置に影響を与える](/view/list_07)

### table

* [表の行グループ要素に指定したheightプロパティがセル要素に継承する](/view/table_01)
* [幅を指定していないテーブルでも固定レイアウトが有効](/view/table_02)
* [collapseボーダーをvisibilityで非表示にできない](/view/table_03)
* [相対配置要素内のテーブル行グループ要素のスタイルが外部にはみ出す](/view/table_04)
* [固定レイアウト表で列の幅が小さくなる](/view/table_05)
* [table要素の上マージンがcaption要素の上に設置される](/view/table_06)

## その他

### overflow

* [幅と高さが明示されていない要素へのoverflow:hidden;指定が完全に反映されない](/view/overflow_01)
* [overflow:scroll;等が指定された要素の背景画像が閲覧領域に対して固定されない](/view/overflow_02)
* [overflowでスクロールバーが出るときの高さ計算が正しくない](/view/overflow_03)
* [overflowへの対応が不完全な要素](/view/overflow_04)

### z-index

* [bodyにz-indexを指定すると子孫要素の背景指定が無視される](/view/z_index_01)
* [z-indexを負の数にしたリンクを選択できない](/view/z_index_02)

### form

* [テキスト入力フォームの幅が文字入力時に変化する](/view/form_01)
* [fieldset要素の上パディングがボーダー領域の外側に設置される](/view/form_02)
* [終了タグを省略したoption要素に続くoptgroup要素を無視する](/view/form_03)
* [背景を指定したフォーム部品で視覚スタイルが無効になる](/view/form_04)

### hr

* [hr要素に指定した下マージンが親要素の下マージンとして反映される](/view/hr_01)

### セレクタ、擬似要素、擬似クラス

* [アンカーを:hover状態にすると%値指定のマージンやパディングの量が変化する](/view/anchor_01)
* [擬似要素名称の直後に空白類文字を置かないと擬似要素が認識されない](/view/anchor_02)
* [「#」だけをセレクタとして指定すると全称セレクタのように扱われる](/view/anchor_03)
* [擬似要素を含む要素に後続する要素の内容物が左右にはみ出る](/view/anchor_04)
* [:visited擬似クラスの宣言が詳細度を無視してカスケード処理される](/view/anchor_05)
* [アンカーを:hover状態にすると親ブロックの高さが変化する](/view/anchor_06)
* [アンカーを:hover状態にすると後続するfloatの一部が消える](/view/anchor_07)
* [アンカーを:hover状態にするとbody要素のサイズが縮む](/view/anchor_08)
* [アンカーを:hover状態にするとiframe要素のサイズが変化する](/view/anchor_09)

### 未分類

* [閲覧領域からはみ出す要素がない状態でもスクロールバーが表示されることがある](/view/other_01)
* [body要素の内容領域をはみ出す部分がレンダリングされない](/view/other_02)
* [行の高さを正しく算出しない](/view/other_03)
* [代替スタイルシート内の指定をprintメディアに反映しない](/view/other_04)
* [インライン要素内のブロック要素がインライン要素のスタイルを継承する](/view/other_05)
* [同一ブロック内では!importantが無視される](/view/other_06)
