Config.HitBehavior = require("config/HitBehavior")

Config.findSkill = function(id)
    local cfg = Config.HeroSkillx[id]
    if not cfg then
        cfg = Config.MonsterSkillx[id]
    end
    if not cfg then
        LogError("找不到id为"..id.."的技能配置")
    end
    return cfg
end
Config.findSkillEffect = function(id)
    local cfg = Config.HeroSkillEffect[id]
    if not cfg then
        cfg = Config.MonsterSkillEffect[id]
    end
    if not cfg then
        LogError("找不到id为"..id.."的技能效果配置")
    end
    return cfg
end

function LangFormat(content, ...)
    local params = {...}
    for i, v in ipairs(params) do
        content = string.gsub(content, "{" .. i .. "}", tostring(v))
    end
    return content
end

function Lang(key, ...)
    key = tostring(key)
    local params = {...}
    local data = Config.Language[key]

    if data then
        if next(params) then
            return LangFormat(data, unpack(params))
        else
            return data
        end
    end
    return "non-existent Language:" .. key
end

function Config.getString(id)
    return Lang(id)
end

