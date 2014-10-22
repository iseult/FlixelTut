package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

class PlayState extends FlxState
{
    private var _player:Player;

    override public function create():Void
    {
        _player = new Player(20, 20);
        add(_player);
        super.create();
    }

    override public function destroy():Void
    {
        super.destroy();
    }

    override public function update():Void
    {
        super.update();
    }
}