return {
    LuaVersion = "LuaU",
    VarNamePrefix = "",
    NameGenerator = "MangledShuffled",
    PrettyPrint = false,
    Seed = 0,
    Steps = {
        {
            Name = "Vmify";
            Settings = {
                
            };
        },
        {
            Name = "ConstantArray";
            Settings = {
                Treshold    = 1;
                StringsOnly = true;
            }
        },
        {
            Name = "WrapInFunction";
            Settings = {

            }
        },
    }
}