直後に背景色つきのhr要素がある絶対配置要素の初期位置がずれている

### 現象

直後に背景色を指定したhr要素を持つ絶対配置要素では、leftプロパティを指定しないときの初期値が0にならない。 left:50%; を指定したときの位置に配置されてしまう。
