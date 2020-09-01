%Stephen Gibson 6/12/20
%
%Final project for my lnaguages class
%Made a population estimator for predator-prey pairs
%Using what I've learned in linear algebra, trajectories and intial conditions
%to predict sizes and graph them


close all
clear h
graphics_toolkit qt
h.ax = axes ("position", [0.1 0.42 0.5 0.5]);
h.fcn = @(x) polyval([-0.1 0.5 3 0], x);

function ret = predictLife (v1, v2, num)
  m = [v1.birthrate, v1.interactionrate;
       v2.interactionrate, v2.birthrate];
  p = [v1.population;
       v2.population];
  result1 = zeros(1,num);
  result2 = zeros(1,num);
  for i = 1:num
    p = m * p;
    if p(1,1) < 0
      result1(1,i) = 0;
      return;
    else
      result1(1,i) = p(1,1);
    endif  
    if p(2,1) < 0
      result2(1,i) = 0;
      return;
    else
      result2(1,i) = p(2,1);
    endif
  endfor
  x = 1:num;
  plot(x, result1, x, result2)
  ylabel("Populations");
  xlabel("Months");
  title("Population over Months")
  legend(v1.name, v2.name);
endfunction
  animal1 = animal(0.5, 0.4, 100, "Owl");
  animal2 = animal(-0.104, 1.1, 1000, "Mouse");
function update_plot(obj)

  h = guidata(obj);
  b1 = str2double(get(h.animal1_birth_edit, "string"));
  b2 = str2double(get(h.animal2_birth_edit, "string"));
  i1 = str2double(get(h.animal1_interaction_edit, "string"));
  i2 = str2double(get(h.animal2_interaction_edit, "string"));
  p1 = str2double(get(h.animal1_population_edit, "string"));
  p2 = str2double(get(h.animal2_population_edit, "string"));
  n1 = get(h.animal1_name_edit, "string");
  n2 = get(h.animal2_name_edit, "string");
  mo = str2num(get(h.months_edit, "string"));
  animal1 = animal(b1, i1, p1, n1);
  animal2 = animal(b2, i2, p2, n2);
  predictLife(animal1, animal2, mo);
  
  switch(gcbo)
    case{h.animal1_name_edit}
      %animal1.name = get(gcbo, "string");
      legend(animal1.name, animal2.name);
    case{h.animal2_name_edit}
      %animal2.name = get(gcbo, "string");
      legend(animal1.name, animal2.name);
    case{h.print_pushbutton}
      fn =  uiputfile ("*.png");
      print (fn);
  endswitch
endfunction

h.animal1_name_label = uicontrol("style", "text",
                                "units", "normalized",
                                "string", "Predator",
                                "horizontalalignment", "left",
                                "position", [0.65 0.9 0.35 0.08]);
h.animal1_name_edit = uicontrol("style", "edit",
                                "units", "normalized",
                                "string", animal1.name,
                                "callback", @update_plot,
                                "position", [0.65 0.85 0.2 0.06]);
h.animal2_name_edit = uicontrol("style", "text",
                                "units", "normalized",
                                "string", "Prey",
                                "horizontalalignment", "left",
                                "position", [0.65 0.75 0.35 0.08]);
h.animal2_name_edit = uicontrol("style", "edit",
                               "units", "normalized",
                               "string", animal2.name,
                               "callback", @update_plot,
                               "position", [0.65 0.7 0.2 0.06]);

h.animal1_birth_label = uicontrol("style", "text",
                                "units", "normalized",
                                "string", "Birth Rates:",
                                "horizontalalignment", "left",
                                "position", [0.65 0.6 0.35 0.08]);
h.animal1_birth_edit = uicontrol("style", "edit",
                               "units", "normalized",
                               "string", "0.5",
                               "callback", @update_plot,
                               "position", [0.65 0.55 0.1 0.06]);
h.animal2_birth_edit = uicontrol("style", "edit",
                               "units", "normalized",
                               "string", "1.1",
                               "callback", @update_plot,
                               "position", [0.75 0.55 0.1 0.06]);

h.animal1_interaction_label = uicontrol("style", "text",
                                "units", "normalized",
                                "string", "Interaction Rates:",
                                "horizontalalignment", "left",
                                "position", [0.65 0.45 0.35 0.08]);
h.animal1_interaction_edit = uicontrol("style", "edit",
                               "units", "normalized",
                               "string", "0.4",
                               "callback", @update_plot,
                               "position", [0.65 0.4 0.1 0.06]);
h.animal2_interaction_edit = uicontrol("style", "edit",
                               "units", "normalized",
                               "string", "-0.104",
                               "callback", @update_plot,
                               "position", [0.75 0.4 0.1 0.06]);

h.animal1_population_label = uicontrol("style", "text",
                                "units", "normalized",
                                "string", "Initial Populations:",
                                "horizontalalignment", "left",
                                "position", [0.65 0.3 0.35 0.08]);
h.animal1_population_edit = uicontrol("style", "edit",
                               "units", "normalized",
                               "string", "100",
                               "callback", @update_plot,
                               "position", [0.65 0.25 0.1 0.06]);
h.animal2_population_edit = uicontrol("style", "edit",
                               "units", "normalized",
                               "string", "1000",
                               "callback", @update_plot,
                               "position", [0.75 0.25 0.1 0.06]);

h.months_label = uicontrol("style", "text",
                                "units", "normalized",
                                "string", "Months:",
                                "horizontalalignment", "left",
                                "position", [0.65 0.15 0.35 0.08]);
h.months_edit = uicontrol("style", "edit",
                               "units", "normalized",
                               "string", "10",
                               "callback", @update_plot,
                               "position", [0.65 0.1 0.1 0.06]);

h.print_pushbutton = uicontrol("style", "pushbutton",
                                "units", "normalized",
                                "string", "Print Prediction",
                                "callback", @update_plot,
                                "position", [0.15 0.1 0.35 0.09]);

set (gcf, "color", get(0, "defaultuicontrolbackgroundcolor"))
guidata (gcf, h)
update_plot (gcf);