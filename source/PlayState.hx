import flixel.util.FlxColor;
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

		generateWaterpools();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		FlxG.watch.addQuick('Seed', seedManager.currentSeed);
	}

	public function generateWaterpools()
	{
		var waterpoolCount = seedManager.int(4, 16);

		trace('Waterpools: $waterpoolCount');

		var attemptNumber = 0;

		while (waterpoolCount > 0)
		{
			final size = (seedManager.int() % 64) + 32;

			final x = seedManager.float(0, FlxG.width - size);
			final y = seedManager.float(0, FlxG.height - size);

			var waterpool = new ButtonSprite(x, y);
			waterpool.makeGraphic(size, size, FlxColor.CYAN);

			var cont = true;

			for (wp in waterPools.members)
			{
				if (!cont)
					continue;

				if (waterpool.overlaps(wp))
					cont = false;
			}

			attemptNumber++;
			if (!cont)
				continue;

			waterPools.add(waterpool);

			trace('Waterpool spawn: ' + {
				size: size,
				x: x,
				y: y,
				attempt: attemptNumber,
			});

			waterpoolCount--;
		}
	}
}
