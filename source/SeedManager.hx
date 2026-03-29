class SeedManager
{
	public var seed:Float = 0;

	public function randomFloat():Float
	{
		final time_MS = Date.now().getTime();
		final time_S = time_MS / 1000;
		final time_M = time_S / 60;
		final time_H = time_M / 60;
		final time_D = time_H / 24;
		final time_Y = time_D / 365.25;

		if (seed == 0)
			seed += time_S;

		seed *= time_Y;

        if (seed % 512 == 0) seed = time_M;

        trace('New seed: $seed');
		return seed;
	}

	public function randomInt():Int
	{
		return Math.round(randomFloat());
	}

	public function new(initalSeed:Float = 0)
	{
		seed = initalSeed;
	}
}
