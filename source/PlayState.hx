import flixel.FlxG;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.FlxState;

class PlayState extends FlxState
{
    public var seedManager:SeedManager;

    public var waterPools:FlxTypedSpriteGroup<ButtonSprite>;

	override function create()
	{
		super.create();

        seedManager = new SeedManager(0);

        waterPools = new FlxTypedSpriteGroup<ButtonSprite>();
        add(waterPools);

        var i = seedManager.randomAbsInt() % 7 + 1;

        while (i > 0)
        {
            var size = (seedManager.randomInt() % 512) + 32;

            var x = 0.0;
            var y = 0.0;

            x = seedManager.randomFloat() % FlxG.width - size;
            y = seedManager.randomFloat() % FlxG.height - size;

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
