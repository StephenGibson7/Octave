classdef animal
  properties
    birthrate;
    interactionrate;
    population;
    name;
  endproperties

  methods
    function thisAnimal = animal(var1, var2, var3, var4)
      thisAnimal.birthrate = var1;
      thisAnimal.interactionrate = var2;
      thisAnimal.population = var3;
      thisAnimal.name = var4;
    endfunction
  endmethods
endclassdef