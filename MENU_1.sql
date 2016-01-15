--------------------------------------------------------
--  DDL for Package Body MENU
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "MENU" AS  

  PROCEDURE GENERATE_MENU_HTML 
  AS
  BEGIN
    HTP.P('<div id="main-nav" class="navbar navbar-inverse">');
			HTP.P('<div class="navbar-inner">');
				HTP.P('<div class="container">');
					HTP.P('<a data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar">');
						HTP.P('<span class="icon-bar"></span>');
						HTP.P('<span class="icon-bar"></span>');
						HTP.P('<span class="icon-bar"></span>');
					HTP.P('</a>');
					HTP.P('<div class="nav-collapse">');
						HTP.P('<ul class="nav">');
							HTP.P('<li class="active"><a href="/nestedNav/">These</a></li>');
							HTP.P('<li><a href="/nestedNav/">Are</a></li>');
							HTP.P('<li class="dropdown">');
								HTP.P('<a data-toggle="dropdown" class="dropdown-toggle" href="/nestedNav/">Boring <b class="caret"></b></a>');
								HTP.P('<ul class="dropdown-menu">');
									HTP.P('<li><a href="/nestedNav/">Links</a></li>');
									HTP.P('<li><a href="/nestedNav/">You</a></li>');
									HTP.P('<li><a href="/nestedNav/">Should not</a></li>');
									HTP.P('<li><a href="/nestedNav/">Click</a></li>');
									HTP.P('<li><a href="/nestedNav/">Snore</a></li>');
									HTP.P('<li class="dropdown-submenu">');
										HTP.P('<a data-toggle="dropdown" class="dropdown-toggle" href="/nestedNav/">Fruits <b class="caret"></b></a>');
										HTP.P('<ul class="dropdown-menu">');
											HTP.P('<li><a href="/nestedNav/">Bananas</a></li>');
											HTP.P('<li><a href="/nestedNav/">Watermelons</a></li>');
											HTP.P('<li><a href="/nestedNav/">Tomatoes</a></li>');
										HTP.P('</ul>');
									HTP.P('</li>');
								HTP.P('</ul>');
							HTP.P('</li>');
                            HTP.P('<li class="dropdown">');
                                HTP.P('<a data-toggle="dropdown" class="dropdown-toggle" href="javascript:void(0);">Linkless Dropdown <b class="caret"></b></a>');
                                HTP.P('<ul class="dropdown-menu">');
                                    HTP.P('<li><a href="/nestedNav/">Tomato</a></li>');
									HTP.P('<li><a href="/nestedNav/">Carrot</a></li>');
									HTP.P('<li><a href="/nestedNav/">Olive</a></li>');
                                HTP.P('</ul>');
                            HTP.P('</li>');
						HTP.P('</ul>');
					HTP.P('</div>');
				HTP.P('</div>');
			HTP.P('</div>');
		HTP.P('</div>');
  END;

  FUNCTION GenerateMenu RETURN MENU_TYPE
  PIPELINED AS
    CURSOR items is
      select * from DM_MENU;
--  SELECT level,SUPER_TYP_ID,SUPER_TYPE_NAME from DM_SUPER_TYP
--  CONNECT BY PRIOR SUPER_TYP_ID = GROUP_ID
--  START WITH SUPER_TYP_ID = 203000;

    dm_menu_rec DM_MENU%ROWTYPE;
    dm_super_type_rec DM_SUPER_TYP%ROWTYPE;
    out_rec MENU_ITEM := MENU_ITEM(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
  BEGIN
    for item in items loop
--      if item.SUPER_TYP_ID != 203000 then
        select * into dm_menu_rec from DM_MENU WHERE MENU_ID = item.MENU_ID;
        out_rec.MENU_ID :=dm_menu_rec.MENU_ID;
        out_rec.LVL := dm_menu_rec.lvl;
        if dm_menu_rec.LABEL_ID is not null then 
          out_rec.LABEL := dm_super_typ_tapi.lookup_name(p_super_type_id => item.LABEL_ID);
        else
          out_rec.LABEL := dm_menu_rec.label;
        end if;
        if v('APP_USER') = 'FPARDI' then
          out_rec.LABEL := out_rec.LABEL ||'('||dm_menu_rec.menu_id||')';
        end if;
        out_rec.PAGE_ID := dm_menu_rec.PAGE_ID;
        out_rec.IS_CURRENT_LIST_ENTRY :=dm_menu_rec.IS_CURRENT_LIST_ENTRY;
        out_rec.IMAGE :=dm_menu_rec.IMAGE;
        out_rec.IMAGE_ATTRIBUTE :=dm_menu_rec.IMAGE_ATTRIBUTE;
        out_rec.IMAGE_ALT_ATTRIBUTE :=dm_menu_rec.IMAGE_ALT_ATTRIBUTE;
        out_rec.ORDER1 :=dm_menu_rec.ORDER1;
        out_rec.ORDER2 :=dm_menu_rec.ORDER2;
        out_rec.TREATM_GROUP_ID :=dm_menu_rec.TREATM_GROUP_ID;
        out_rec.APEX_VARIABLE :=dm_menu_rec.APEX_VARIABLE;
        out_rec.ROLL_TYPE :=dm_menu_rec.ROLL_TYPE;  
        PIPE ROW(out_rec);
--      end if;
    end loop;
    return;
  END GenerateMenu;

END MENU;

/
