extends Node


var icons = {"c": null,
			"cpp": null,
			"python": null,
			"ruby": null,
			"java": null,
			"php": null,
			"sql": null,
			"VB": null,
			"perl": null,
			"swift": null,
			"matlab": null,
			"ada": null,
			"cython": null,
			"elixir": null,
			"gdscript": null,
			"crystal": null,
			"powershell": null,
			"lua": null
			};

var small_icons = [preload("res://assets/ada_icon_small.png"),
					preload("res://assets/c_icon_small.png"),
					preload("res://assets/cpp_icon_small.png"),
					preload("res://assets/crystal_icon_small.png"),
					preload("res://assets/cython_icon_small.png"),
					preload("res://assets/elixir_icon_small.png"),
					preload("res://assets/godot_icon_small.png"),
					preload("res://assets/java_icon_small.png"),
					preload("res://assets/lua_icon_small.png"),
					preload("res://assets/matlab_icon_small.png"),
					preload("res://assets/perl_icon_small.png"),
					preload("res://assets/php_icon_small.png"),
					preload("res://assets/powershell_icon_small.png"),
					preload("res://assets/py_icon_small.png"),
					preload("res://assets/ruby_icon_small.png"),
					preload("res://assets/sql_icon_small.png"),
					preload("res://assets/swift_icon_small.png"),
					preload("res://assets/VB_icon_small.png")];

var cppAttrib = {"image": load("res://assets/cpp_icon.png"),
				"interVScomp": "compiled",
				};

var pythonAttrib = {"image": load("res://assets/py_icon.png"),
					"interVScomp": "byte",
					};

var rubyAttrib = {"image": load("res://assets/ruby_icon.png"),
				"interVScomp": "interpreted",
				};

var javaAttrib = {"image": load("res://assets/java_icon.png"),
				"interVScomp": "byte",
				};

var phpAttrib = {"image": load("res://assets/php_icon.png"),
				"interVScomp": "interpreted",
				};

var sqlAttrib = {"image": load("res://assets/sql_icon.png"),
				"interVScomp": "interpreted",
				};

var cAttrib = {"image": load("res://assets/c_icon.png"),
				"interVScomp": "compiled",
				};

var vbAttrib = {"image": load("res://assets/VB_icon.png"), 
				"interVScomp": "byte",
				};

var perlAttrib = {"image": load("res://assets/perl_icon.png"), 
				"interVScomp": "interpreted",
				};

var swiftAttrib = {"image": load("res://assets/swift_icon.png"), 
				"interVScomp": "compiled",
				};

var matlabAttrib = {"image": load("res://assets/matlab_icon.png"), 
				"interVScomp": "interpreted",
				};

var adaAttrib = {"image": load("res://assets/ada_icon.png"), 
				"interVScomp": "compiled",
				};

var cythonAttrib = {"image": load("res://assets/cython_icon.png"), 
				"interVScomp": "compiled",
				};

var elixirAttrib = {"image": load("res://assets/elixir_icon.png"), 
				"interVScomp": "byte",
				};

var gdAttrib = {"image": load("res://assets/godot_icon.png"), 
				"interVScomp": "byte",
				};

var cryAttrib = {"image": load("res://assets/crystal_icon.png"), 
				"interVScomp": "compiled",
				};

var powerAttrib = {"image": load("res://assets/powershell_icon.png"), 
				"interVScomp": "interpreted",
				};

var luaAttribs = {"image": load("res://assets/lua_icon.png"), 
				"interVScomp": "byte",
				};

func _ready():
	icons["cpp"] = cppAttrib;
	icons["python"] = pythonAttrib;
	icons["ruby"] = rubyAttrib;
	icons["java"] = javaAttrib;
	icons["php"] = phpAttrib;
	icons["sql"] = sqlAttrib;
	icons["c"] = cAttrib;
	icons["VB"] = vbAttrib;
	icons["perl"] = perlAttrib;
	icons["swift"] = swiftAttrib;
	icons["matlab"] = matlabAttrib;
	icons["ada"] = adaAttrib;
	icons["cython"] = cythonAttrib;
	icons["elixir"] = elixirAttrib;
	icons["gdscript"] = gdAttrib;
	icons["crystal"] = cryAttrib;
	icons["powershell"] = powerAttrib;
	icons["lua"] = luaAttribs;
