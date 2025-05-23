local kana_list = {
	{ hira = "あ", kata = "ア", romaji = "a" },
	{ hira = "い", kata = "イ", romaji = "i" },
	{ hira = "う", kata = "ウ", romaji = "u" },
	{ hira = "え", kata = "エ", romaji = "e" },
	{ hira = "お", kata = "オ", romaji = "o" },
	{ hira = "か", kata = "カ", romaji = "ka" },
	{ hira = "さ", kata = "サ", romaji = "sa" },
	-- Add more kana here...
}

local game = {
	current = nil,
	reveal = false,
}

local function pick_random_kana()
	game.current = kana_list[math.random(#kana_list)]
	game.reveal = false
end

local function render_kana()
	if not game.current then
		pick_random_kana()
	end
	local r = game.reveal and game.current.romaji or "???"
	return {
		"",
		"🎌 Kana Challenge 🎌",
		"",
		"Hiragana: " .. game.current.hira,
		"Katakana: " .. game.current.kata,
		"Romaji:   " .. r,
		"",
		"Press 'r' to reveal or skip",
	}
end

vim.keymap.set("n", "r", function()
  if game.reveal then
    pick_random_kana()
  else
    game.reveal = true
  end
  require("snacks").redraw()
end, { desc = "Toggle kana romaji" })
