draw_set_font(fSimSum12);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(400, yy, "游戏结束！", 4, 4, 0);
draw_set_halign(fa_left);
draw_text_transformed(16, yy + 128, "I Wanna Super Ability", 2, 2, 0);
draw_text_transformed(16, yy + 176, "制作者：魔方12139", 2, 2, 0);

var actorY = yy + 272;
draw_set_halign(fa_center);
draw_text_transformed(400, actorY, "演员", 4, 4, 0);
draw_text_transformed(400, actorY + 64, "Actor", 2, 2, 0);

draw_sprite_ext(sprBoss1, 0, 400, actorY + 208, 2, 2, 0, c_white, 1);
draw_text_transformed(400, actorY + 272, "没有对象的Kid", 2, 2, 0);
draw_sprite(sprMiku, 0, 583, actorY + 832);
draw_text_transformed(400, actorY + 848, "初音ミク", 2, 2, 0);
draw_sprite(sprLty, 0, 550, actorY + 1408);
draw_text_transformed(400, actorY + 1424, "洛天依", 2, 2, 0);
draw_text_transformed(400, actorY + 1504, "（没有3D模式，这张图片不想显示）", 2, 2, 0);
draw_text_transformed(400, actorY + 1552, "大魔方", 2, 2, 0);

var thanksY = yy + 1920;
draw_text_transformed(400, thanksY, "特别感谢", 4, 4, 0);
draw_text_transformed(400, thanksY + 64, "Special Thanks", 2, 2, 0);

draw_set_halign(fa_left);
draw_text_transformed(16, thanksY + 160, "逍遥散人", 2, 2, 0);
draw_text_transformed(16, thanksY + 192, "bilibili UP主 uid: 168598", 2, 2, 0);
draw_text_transformed(16, thanksY + 224, "给了我创作灵感", 2, 2, 0);
draw_text_transformed(16, thanksY + 304, "盲人张卫2019", 2, 2, 0);
draw_text_transformed(16, thanksY + 336, "bilibili UP主 uid: 471676923", 2, 2, 0);
draw_text_transformed(16, thanksY + 368, "听我说-洛天依 制作者 BV1oy4y1Y79L", 2, 2, 0);
draw_text_transformed(16, thanksY + 448, "我自己", 2, 2, 0);

var tyfpY = thanksY + 736;
draw_set_halign(fa_center);
draw_text_transformed(400, tyfpY, "谢谢你玩游戏", 4, 4, 0);
draw_text_transformed(400, tyfpY + 64, "Thank you for playing", 2, 2, 0);

draw_set_halign(fa_left);
draw_set_color(c_black);