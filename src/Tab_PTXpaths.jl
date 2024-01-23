function Tab_PTXpaths()
    html_div([
        html_div("‎ "),
        dbc_row([ 

                dbc_col([  

                    dbc_row([

                        dbc_button("Configuration",id="button-config"),
                        dbc_collapse(
                            dbc_card(dbc_cardbody([
                                dbc_row([
                                    dbc_col([ 
                                        html_h1("Thermodynamic database", style = Dict("textAlign" => "center","font-size" => "120%", "marginTop" => 2)),
                                    ]),
                                    dbc_col([ 
                                        dcc_dropdown(   id      = "database-dropdown-ptx",
                                                        options = [
                                                            Dict(   "label" => dba.database[i],
                                                                    "value" => dba.acronym[i]  )
                                                                        for i=1:size(dba,1)
                                                        ],
                                                        value="ig" ,
                                                        clearable   = false,
                                                        multi       = false),
                                    ]),
                                    dbc_tooltip([
                                        html_div("Here you can select the thermodynamic database you want"),
                                        html_div("Note that the chemical system can be different from database to another"),
                                                ],target="database-dropdown-ptx"),
                                    ]),


                                    #clinopyroxene for metabasite
                                    html_div([
                                        html_div("‎ "),  
                                        dbc_row([
                                            dbc_col([ 
                                                html_h1("clinopyroxene", style = Dict("textAlign" => "center","font-size" => "120%")),
                                            ],width=6),
                                            dbc_col([ 
                                                html_div("Omph"),
                                            ],width=3),
                                            dbc_col([ 
                                                dbc_row(dbc_switch(label="", id="mb-cpx-switch-ptx", value=false),justify="center"),
                                            ]),
                                            dbc_col([ 
                                                html_div("Aug"),
                                            ]),
                                        ]),
                                    ], style = Dict("display" => "none"), id      = "switch-cpx-id-ptx"), #none, block

                                    #clinopyroxene for metabasite
                                    html_div([
                                        html_div("‎ "),  
                                        dbc_row([
                                            dbc_col([ 
                                            ],width=6),

                                            dbc_col([ 
                                                dcc_checklist(
                                                    id      ="limit-ca-opx-id-ptx",
                                                    options = [
                                                        Dict("label" => " Limit Ca-opx", "value" => "CAOPX"),
                                                    ],
                                                    value   = [""],
                                                    inline  = true,
                                                ),
                                                dbc_tooltip("This activate a smaller range for compositional variable of opx for the igneous database sets",target="limit-ca-opx-id-ptx"),

                                            ]),
                                            dbc_col([ 
                                                html_div([
                                                dbc_input(
                                                    id      = "ca-opx-val-id-ptx",
                                                    type    = "number", 
                                                    min     = 0.0, 
                                                    max     = 1.0, 
                                                    value   = 0.5   ),
                                                ], style = Dict("marginTop" => -5)),
                                            ],width=3),

                                        ]),
                                    ], style = Dict("display" => "block"), id      = "switch-opx-id-ptx"), #none, block



                                    # buffer
                                    dbc_row([
                                        dbc_col([ 
                                            html_h1("Buffer", style = Dict("textAlign" => "center","font-size" => "120%", "marginTop" => 8)),
                                        ]),
                                        dbc_col([ 
                                            dcc_dropdown(   id      = "buffer-dropdown-ptx",
                                            options = [
                                                (label = "no buffer",value = "none"),
                                                (label = "QFM",      value = "qfm"),
                                                (label = "MW",       value = "mw"), 
                                                (label = "QIF",      value = "qif"),
                                                (label = "CCO",      value = "cco"),
                                                (label = "HM",       value = "hm"), 
                                                (label = "NNO",      value = "nno"), 
                                            ],
                                            value="none" ,
                                            clearable   = false,
                                            multi       = false),
                                        ]),
                                    ]),
                                    #solver
                                    dbc_row([
                                        dbc_col([ 
                                            html_h1("Solver", style = Dict("textAlign" => "center","font-size" => "120%", "marginTop" => 8)),
                                        ]),
                                        dbc_col([ 
                                            dcc_dropdown(   id      = "solver-dropdown-ptx",
                                            options = [
                                                (label = "PGE",         value = "pge"),
                                                (label = "Legacy",      value = "lp"),
                                                (label = "Hybrid",      value = "hyb")
                                            ],
                                            value="hyb" ,
                                            clearable   = false,
                                            multi   = false),
                                        ]),
                                    ]),
                                    #verbose
                                    dbc_row([
                                        dbc_col([ 
                                            html_h1("Verbose", style = Dict("textAlign" => "center","font-size" => "120%", "marginTop" => 8)),
                                        ]),
                                        dbc_col([ 
                                            dcc_dropdown(   id      = "verbose-dropdown-ptx",
                                            options = [
                                                (label = "none",        value = -1),
                                                (label = "light",       value =  0),
                                                (label = "full",        value =  1),
                                            ],
                                            value       = -1,
                                            clearable   = false,
                                            multi       = false),
                                        ]),
                                    ]),

                                ])),
                                id="collapse-config",
                                is_open=true,
                        ),
                    
                    ])


                    dbc_row([dbc_button("Bulk-rock composition",id="button-bulk-ptx"),
                    dbc_collapse(
                        dbc_card(dbc_cardbody([

                                    dbc_row([
                                            dbc_col([

                                                dcc_upload(
                                                    id="upload-bulk-ptx",
                                                    children=html_div([
                                                        "Drag and drop or select bulk-rock file",
                                                    ]),
                                                    style=Dict(
                                                        "width" => "100%",
                                                        "height" => "60px",
                                                        "lineHeight" => "60px",
                                                        "borderWidth" => "1px",
                                                        "borderStyle" => "dashed",
                                                        "borderRadius" => "5px",
                                                        "textAlign" => "center"
                                                    ),
                                                    # Allow multiple files to be uploaded
                                                    multiple=false
                                                ),
                                                dbc_alert(
                                                    "Bulk-rock(s) composition(s) successfully loaded",
                                                    id      = "output-data-uploadn-ptx",
                                                    is_open = false,
                                                    duration= 4000,
                                                ),
                                                dbc_alert(
                                                    "Bulk-rock(s) composition(s) failed to load, check input file format",
                                                    color="danger",
                                                    id      ="output-data-uploadn-failed-ptx",
                                                    is_open = false,
                                                    duration= 4000,
                                                ),
                                                # html_div(id="output-data-uploadn"),
                                                dbc_tooltip([
                                                    html_div("An example of file providing bulk-rock compositions is given in the 'examples' folder"),
                                                    html_div("The structure of the file should comply with the following structure:"),
                                                    html_div("title::String; comments::String; db::String; sysUnit::String; oxide::Vector{String}; frac::Vector{Float64}")
                                                            ],target="upload-bulk-ptx"),

                                                html_div("‎ "),
                                                dbc_row([

                                                    html_div([
                                                        dcc_dropdown(   id      = "test-dropdown-ptx",
                                                        options = [
                                                            Dict(   "label" => db[(db.db .== "ig"), :].title[i],
                                                                    "value" => db[(db.db .== "ig"), :].test[i]  )
                                                                        for i=1:length(db[(db.db .== "ig"), :].test)
                                                        ],
                                                        value       = 0,
                                                        clearable   = false,
                                                        multi       = false),
                                                    ], style = Dict("display" => "block"), id      = "test-1-id-ptx"),
                                                ]),


                                                html_div("‎ "),
                                                dbc_row([
                                                    
                                                            html_div([
                                                                dash_datatable(
                                                                    id="table-bulk-rock-ptx",
                                                                    columns=(  [    Dict("id" =>  "oxide",          "name" =>  "oxide",         "editable" => false),
                                                                                    Dict("id" =>  "mol_fraction",   "name" =>  "mol_fraction",  "editable" => true)]
                                                                    ),
                                                                    data        =   [Dict(  "oxide"         => db[(db.db .== "ig") .& (db.test .== 0), :].oxide[1][i],
                                                                                            "mol_fraction"  => db[(db.db .== "ig") .& (db.test .== 0), :].frac[1][i])
                                                                                                for i=1:length(db[(db.db .== "ig") .& (db.test .== 0), :].oxide[1]) ],
                                                                    style_cell  = (textAlign="center", fontSize="140%",),
                                                                    style_header= (fontWeight="bold",),
                                                                    # editable    = true
                                                                ),

                                                                # Buffer multiplier
                                                                html_div([
                                                                html_div("‎ "),
                                                                dbc_row([
                                                                    dbc_col([ 
                                                                        html_h1("Buffer multiplier", style = Dict("textAlign" => "center","font-size" => "120%")),
                                                                    ]),
                                                                    dbc_col([ 
                                                                            dbc_input(
                                                                            id      = "buffer-1-mul-id-ptx",
                                                                            type    = "number", 
                                                                            min     = -50.0, 
                                                                            max     = +50.0, 
                                                                            value   = 0.0   ),
                                                                    ]),
                                                                ]),
                                                                ], style = Dict("display" => "none"), id      = "buffer-1-id-ptx"), #none, block

                                                            ], style = Dict("display" => "block"), id      = "table-1-id-ptx"), #none, block
                                                ]),


                                                html_div("‎ "),
                                                dcc_textarea(
                                                    id="database-caption-ptx",
                                                    value       = db[(db.db .== "ig") .& (db.test .== 0), :].db[1],
                                                    readOnly    = true,
                                                    disabled    = true,
                                                    draggable   = false,
                                                    style       = Dict("textAlign" => "center","font-size" => "100%", "width"=> "100%", "resize"=> "none")
                                                ),

                                            ]),

                                            ], justify="center"),
                                            ])
                                        ),
                                        id="collapse-bulk-ptx",
                                        is_open=true,
                                ),

                        ])


 
                ], width=3),

                dbc_col([  

                    dbc_row([ 
                        dbc_col([ 
                        
                            dbc_row([

                                dbc_button("Path definition",id="button-pathdef"),
                                dbc_collapse(
                                dbc_card(dbc_cardbody([

                                    dbc_row([

                                        dash_datatable(
                                            id="ptx-table",
                                            columns=[Dict("name" => "P [kbar]", "id"    => "col-1", "deletable" => false, "renamable" => false, "type" => "numeric"),
                                                        Dict("name" => "T [°C]", "id"   => "col-2", "deletable" => false, "renamable" => false, "type" => "numeric")],
                                            data=[
                                                Dict("col-1" => 5.0, "col-2"    => 500.0),
                                                Dict("col-1" => 10.0, "col-2"   => 800.0),
                                            ],
                                            style_cell      = (textAlign="center", fontSize="140%",),
                                            style_header    = (fontWeight="bold",),
                                            editable        = true,
                                            row_deletable   = true
                                        ),

                                    ]),
                                    dbc_row([
                                        dbc_button("Add new point",id="add-row-button", color="light", className="me-2", n_clicks=0,
                                        style       = Dict( "textAlign"     => "center",
                                                            "font-size"     => "100%",
                                                            "border"        =>"1px lightgray solid")), 
                                    ]),

                                ])),
                                id="collapse-pathdef",
                                is_open=true,
                                ),
                                                                                
                            ])

                        ], width=3),

                        dbc_col([ 
                        
                            dbc_row([

                                dbc_button("Path preview",id="button-path"),
                                dbc_collapse(
                                dbc_card(dbc_cardbody([

                                    dbc_row([
                                        path_plot(),
                                    ]),
                                    

                                ])),
                                id="collapse-path",
                                is_open=true,
                                ),
                                                                                
                            ])

                        ], width=4),



                        dbc_col([ 

                            dbc_row([

                                dbc_button("Path options",id="button-path-opt"),
                                dbc_collapse(
                                    dbc_card(dbc_cardbody([
                                        # resolution is number of computational steps between two points
                                        dbc_row([
                                            dbc_col([ 
                                                html_h1("Resolution", style = Dict("textAlign" => "center","font-size" => "120%", "marginTop" => 8)),
                                            ], width=6),
                                            dbc_col([ 
                                                    dbc_input(
                                                    id      = "n-steps-id-ptx",
                                                    type    = "number", 
                                                    min     = 1, 
                                                    max     = 1024, 
                                                    value   = 4   ),
                                            ]),
                                        ]),                               
                                        # PTX mode
                                        dbc_row([
                                            dbc_col([ 
                                                html_h1("P-T-X Mode", style = Dict("textAlign" => "center","font-size" => "120%", "marginTop" => 8)),
                                            ], width=6),
                                            dbc_col([ 
                                                dcc_dropdown(   id      = "mode-dropdown-ptx",
                                                options = [
                                                    (label = "Equilibrium",                 value = "eq"),
                                                    (label = "Fractional melting",          value = "fm"),
                                                    (label = "Fractional crystallization",  value = "fc"), 
                                                ],
                                                value       = "eq",
                                                clearable   =  false,
                                                multi       =  false    ),
                                            ]),
                                        ]),


                                        # connectivity threshold for fracitonal melting
                                        html_div([
                                            dbc_row([
                                                dbc_col([ 
                                                    html_h1("Connectivity threshold [%]", style = Dict("textAlign" => "center","font-size" => "120%", "marginTop" => 8)),
                                                ], width=6),
                                                dbc_col([ 
                                                        dbc_input(
                                                        id      = "connectivity-id",
                                                        type    = "number", 
                                                        min     = 0, 
                                                        max     = 100.0, 
                                                        value   = 7.0   ),
                                                ]),
                                            ]), 
                                        ], style = Dict("display" => "none"), id      = "show-connectivity-id"), #none, block

                                        # residual fraction for fractional crystallization
                                        html_div([
                                            dbc_row([
                                                dbc_col([ 
                                                    html_h1("Residual fraction [%]", style = Dict("textAlign" => "center","font-size" => "120%", "marginTop" => 8)),
                                                ], width=6),
                                                dbc_col([ 
                                                        dbc_input(
                                                        id      = "residual-id",
                                                        type    = "number", 
                                                        min     = 0, 
                                                        max     = 100.0, 
                                                        value   = 7.0   ),
                                                ]),
                                            ]), 
                                        ], style = Dict("display" => "none"), id      = "show-residual-id"), #none, block




                                        html_div("‎ "),
                                        dbc_row([
                                            dbc_button("Compute path",id="compute-path-button", color="light", className="me-2", n_clicks=0,
                                            style       = Dict( "textAlign"     => "center",
                                                                "font-size"     => "100%",
                                                                "border"        =>"1px lightgray solid")), 
                                        ]),


                                    ])),
                                    id="collapse-path-opt",
                                    is_open=true,
                                ),
                                                                                
                        #     ])

                        # ], width=3),



                        # dbc_col([ 

                        #     dbc_row([

                                dbc_button("Display options",id="button-disp-opt"),
                                dbc_collapse(
                                    dbc_card(dbc_cardbody([

                                        dbc_row([
                                            dbc_col([ 
                                                html_h1("System unit", style = Dict("textAlign" => "center","font-size" => "120%", "marginTop" => 8)),
                                            ], width=6),
                                            dbc_col([ 
                                                dcc_dropdown(   id      = "sys-unit-ptx",
                                                options = [
                                                    (label = "mol%",  value = "mol"),
                                                    (label = "wt%",   value = "wt"),
                                                    (label = "vol%",  value = "vol"), 
                                                ],
                                                value       = "mol",
                                                clearable   =  false,
                                                multi       =  false    ),
                                            ]),
                                        ]),
   


                                    ])),
                                    id="collapse-disp-opt",
                                    is_open=true,
                                ),
                                                                                
                            ])

                        ], width=3),



                    ]),
                    html_div("‎ "),
                    dbc_row([                                                                                     
                        dbc_col([
                            dbc_row([
                                PTX_plot()
                            ]),
                            # dbc_row([
                            #     PTX_frac_plot()
                            # ]),      
                        
                        ], width=12),
                    ]),

                ], width=9),


            ]),

    ])

end


# dash_datatable(
#     id="adding-rows-table",
#     columns=[Dict(
#         "name" =>  "Column $i",
#         "id" =>  "column-$i",
#         "deletable" =>  true,
#         "renamable" =>  true
#     ) for i in 1:4],
#     data=[
#         Dict("column-$i" =>  (j + (i-1)*5)-1 for i in 1:4)
#         for j in 1:5
#     ],
#     editable=true,
#     row_deletable=true
# ),