package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxDestroyUtil;

class MenuState extends FlxState
{
    private var _btnPlay: FlxButton;

    override public function create():Void
    {
        _btnPlay = new FlxButton(0, 0, "Play", clickPlay);
        add(_btnPlay);
        super.create();
    }

    override public function destroy():Void
    {
        super.destroy();
        _btnPlay = FlxDestroyUtil.destroy(_btnPlay);
    }

    override public function update():Void
    {
        super.update();
    }

    private function clickPlay():Void
    {
        FlxG.switchState(new PlayState());
    }
}