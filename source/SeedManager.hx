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

		if (seed % 512 == 0)
			seed = time_M;

		trace('New float seed: $seed');
		return seed;
	}

	public function randomInt():Int
	{
		final i = Math.round(randomFloat());

		trace('New int seed: $i');
		return i;
	}

	public function randomAbsFloat():Float
	{
        var af = Math.abs(randomFloat());
        if (af < 0) af = -af;

		trace('New abs float seed: $af');
		return af;
	}

	public function randomAbsInt():Int
	{
        var ai = Math.round(Math.abs(randomInt()));
        if (ai < 0) ai = -ai;

		trace('New abs int seed: $ai');
		return ai;
	}

	public function new(initalSeed:Float = 0)
	{
		seed = initalSeed;
	}
}
