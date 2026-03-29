import flixel.math.FlxRandom;
import flixel.math.FlxMath;
import flixel.FlxG;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.FlxState;

class PlayState extends FlxState
{
    public var seedManager:FlxRandom;

    public var waterPools:FlxTypedSpriteGroup<ButtonSprite>;

	override function create()
	{
		super.create();

        seedManager = new FlxRandom(0);

        waterPools = new FlxTypedSpriteGroup<ButtonSprite>();
        add(waterPools);

        var i = (FlxMath.absInt(seedManager.int()) % 7) + 1;

        trace('Waterpools: $i');

        while (i > 0)
        {
            var size = (seedManager.int() % 512) + 32;

            var x = 0.0;
            var y = 0.0;

            x = seedManager.float() % FlxG.width - size;
            y = seedManager.float() % FlxG.height - size;

            trace('waterpool: ' + {
                size: size,
                x: x,
                y: y,
            });

            i--;
        }
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

        FlxG.watch.addQuick('Seed', seedManager.seed);
	}
}
