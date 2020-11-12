PlayerPrefsUtils = {}
local Key_SelectLevel = "SelectLevel"
local Key_SelectTestLevel = "SelectTestLevel"
local Key_LocalServerindex = "Key_LocalServerindex"
local Key_LocalServerAccountID = "Key_LocalServerAccountID"
local Key_LocalServerPassword = "Key_LocalServerPassword"

function PlayerPrefsUtils.getSelectLevelId()
	local dungeonId = PlayerPrefs.GetInt(Key_SelectLevel,10001)
	if not Config.DungeonLevel[dungeonId] then
		PlayerPrefs.DeleteKey(Key_SelectLevel)
		for k,v in pairs(Config.DungeonLevel) do
			dungeonId = v.id
			break
		end
    end
    return dungeonId
end

function PlayerPrefsUtils.saveSelectLevelId(levelId)
	PlayerPrefs.SetInt(Key_SelectLevel,levelId)
end

function PlayerPrefsUtils.getSelectTestLevelId()
	local dungeonId = PlayerPrefs.GetInt(Key_SelectTestLevel, 10001)
	return dungeonId
end

function PlayerPrefsUtils.saveSelectTestLevelId(levelId)
	PlayerPrefs.SetInt(Key_SelectTestLevel,levelId)
end


local Key_SelectHero = "SelectHero"
function PlayerPrefsUtils.getSelectHeroId()
    return PlayerPrefs.GetInt(Key_SelectHero, 0)
end

function PlayerPrefsUtils.saveSelectHeroId(heroId)
	PlayerPrefs.SetInt(Key_SelectHero,heroId)
end

function PlayerPrefsUtils.setLocalServerIndex(index)
	PlayerPrefs.SetInt(Key_LocalServerindex,index)
end

function PlayerPrefsUtils.getLocalServerIndex()
	return PlayerPrefs.GetInt(Key_LocalServerindex) ~= 0 and PlayerPrefs.GetInt(Key_LocalServerindex) or 1;
end

function PlayerPrefsUtils.setLocalServerAccountID(accountID)
	PlayerPrefs.SetString(Key_LocalServerAccountID,accountID)
end

function PlayerPrefsUtils.getLocalServerAccountID()
	return PlayerPrefs.GetString(Key_LocalServerAccountID);
end

function PlayerPrefsUtils.setLocalServerPassword(password)
	PlayerPrefs.SetString(Key_LocalServerPassword,password)
end

function PlayerPrefsUtils.getLocalServerPassword()
	return PlayerPrefs.GetString(Key_LocalServerPassword);
end

return PlayerPrefsUtils