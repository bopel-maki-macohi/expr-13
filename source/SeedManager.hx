import flixel.math.FlxMath;
import flixel.FlxG;

class SeedManager
{
	public var seed:Float = 0;

	public function randomFloat():Float
	{
        if (seed == 0)
            seed += FlxG.random.int(1, 32);

        seed *= FlxG.random.float(-10, 10, [1]);

        seed = FlxMath.roundDecimal(seed, 2);

		trace('New float seed: $seed');
		return seed;
	}

	public function randomInt():Int
	{
		final i = Math.round(randomFloat());

		trace('New int seed: $i');
		return i;
	}

	public function new(initalSeed:Float = 0)
	{
		seed = initalSeed;
	}
}
