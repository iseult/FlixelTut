# Part III: 基礎

> [Part III: Groundwork | HaxeFlixel 2D Game Framework](http://haxeflixel.com/documentation/part-iii-groundwork/)

チュートリアル全体を通して単純なダンジョン探索ゲームを作る。

プレイヤーは一体のキャラクターを操作し、マップを歩き回り敵と戦い、そしてゴールドを得る。

さて、これらすべてのゲームの特徴はどのようにして HaxeFlixel のプログラムに落とし込むことができるのだろうか？

* 最初に我々は '世界' をセットアップする必要がある - これは単になにかアクションが起きた時に、世界になにが起こるべきかを考えて FlxState を書くということである。
* ダンジョンそれ自体を作るため、簡単に FlxTilemap を用いる - 我々は Flixel とは別のツールを用いてマップを記述する。
* 敵は FlxSprite としたほうがよいだろう、我々は '風変わりな' 方法で違った種類の敵を記述する。
* プレイヤーになにをすべきか、なにが起きているかを提示するためのHUD (ヘッドアップディスプレイ) やインターフェースも必要である。FlxGroup, FlxSprite, FlxTexts, FlxButtons などの組み合わせによってこれを記述する。

この Part III ではまず MenuState から PlayState への移動をプレイヤーが行えるようにする。メニューではオプションなども設定できるようにしたいが、さしあたり PlayState に移行する "Play" というボタンのみを設置する。

MenuState クラスの定義に注目する。

```haxe
class MenuState extends FlxState
{
```

ここの直下にプライベート変数を宣言していく。'Play' ボタンとして使うための FlxButton をまず定義する。

続いて `create` 関数下で `super.create()` が呼び出される前にボタンの初期化を行う。

```haxe
_btnPlay = new FlxButton(0, 0, "Play", clickPlay);
add(_btnPlay);
```

これは FlxButton オブジェクトを生成して _btnPlay 変数に割り当てている。我々はボタンの位置 (0, 0) （ウィンドウ座標の左上からの位置）と、ボタンに表示されるテキスト "Play"、そしてボタンが押されたときに呼び出される関数 "clickPlay" を指定している（clickPlay 関数はまだないが後述）。

そしてこれを add し State にオブジェクトを追加することによって、ボタンが表示され、またやり取りもできるようになる。

ボタンの位置が左上になっているがこれも後で考察する。

続いて clickPlay 関数を作る。

```haxe
private function clickPlay():Void
{
    FlxG.switchState(new PlayState());
}
```

FlxG.switchState によって現在の状態を MenuState から PlayState に切り替えている。

状態が PlayState に変更されると MenuState の destroy メソッドが呼ばれる。new で確保した FlxButton は勝手に解放されないので destroy メソッドによって破棄する必要がある。

まず FlxDestroyUtil を追加。

```haxe
import flixel.util.FlxDestroyUtil;
```

ボタン開放の構文を destroy メソッド中の `super.destroy()` が呼ばれた後に記述する。

```haxe
_btnPlay = FlxDestroyUtil.destroy(_btnPlay);
```

これでメニュー画面が完成した。

