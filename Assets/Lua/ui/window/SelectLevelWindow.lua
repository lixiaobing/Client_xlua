---@class SelectLevelWindow
local SelectLevelWindow = DClass("SelectLevelWindow", BaseWindow)
_G.SelectLevelWindow = SelectLevelWindow

function SelectLevelWindow:onAsset()
    self.assetKeys = {
        "UI/Component/LevelItem"
    }
    
    self.assetComplete = function(index, obj)
        if index == 1 then
            self.itemPrefab = obj
            Log("self.itemPrefab is loaded" )
        end
    end
end

function SelectLevelWindow:onInit()
    self.levels = {}
    for i=1,30 do
        local cfg = Config.DungeonLevel[10000+i]
        if cfg then
            table.insert(self.levels, cfg)
        end
    end
    table.sort(self.levels ,function (a,b)
        return a.id < b.id
    end)
    self.selectLevelID = PlayerPrefsUtils.getSelectTestLevelId()

    self.items = {}
    self.listView = self.transform:Find("Scroll View"):GetComponent(typeof(ListView))
    self:initList()
    local buttonBack = self.transform:Find("ButtonBack"):GetComponent(typeof(Button))
    self:addEventHandler(buttonBack.onClick, function()
        self:close()
    end)
    --确定选择
    local buttonSure = self.transform:Find("ButtonSure"):GetComponent(typeof(Button))
    self:addEventHandler(buttonSure.onClick, function()
        --返回关卡界面

        PlayerPrefsUtils.saveSelectTestLevelId(self.selectLevelID)

        --[[
        UIManager.openWindow(
            "LoadSceneWindow",
            function()
                self:close()

                local selectHeroId = PlayerPrefsUtils.getSelectHeroId()
                local selectLevelID = PlayerPrefsUtils.getSelectTestLevelId()
                BattleFactory.enter({selectHeroId}, selectLevelID)
            end
        )
        self:close()
        --]]

        --所有进入战斗都要通过阵容界面 @Modified by Liukeming 2020-8-3
        local levelID = PlayerPrefsUtils.getSelectTestLevelId()
        UIManager.openWindow("FormationWindow", nil, levelID, function(herosID)
            UIManager.openWindow("LoadSceneWindow", function()
                UIManager.closeAllWindow("LoadSceneWindow")
                BattleFactory.enter(herosID, levelID)
            end)
        end)
    end)
end

function SelectLevelWindow:initList()
    for k,v in ipairs(self.levels) do
        local item = self:createItem(v.id , k);
        self.listView:AddItem(item.obj.gameObject);
        table.insert(self.items,item)
        self:addEventHandler(item.obj.onClick, function()
            self:onClickItem(item);
        end)
        if self.selectLevelID == v.id then --选中
            item.gameObjectSelect.gameObject:SetActive(true)
            -- item.content.localScale = Vector3.one*1.04
        end
    end
end

function SelectLevelWindow:createItem(id,index)
    local prefab =  self.itemPrefab
    local obj = GameObject.Instantiate(prefab)
    obj.transform:SetParent(self.transform,false)
    local config      = Config.DungeonLevel[id]
    local content     = obj.transform:Find("Content")
    local gameObjectSelect      = content:Find("Select")
    local text_number = content:Find("Text_number"):GetComponent(typeof(Text))
    local text_index  = content:Find("Text_index"):GetComponent(typeof(Text))
    local text_name   = content:Find("Text_name"):GetComponent(typeof(Text))
    local icon        = content:Find("Image_icon"):GetComponent(typeof(Image))
    text_name.text    = config.dungeon_name
    --TODO 需要策划配置
    text_number.text  = string.format("%02d",index) 
    text_index.text   = config.dungeon_name   
    --UIUtil.setSprite(icon, "Icon/Level/"..config.icon)
    gameObjectSelect.gameObject:SetActive(false)
    content.localScale = Vector3.one

    local item = {}
    item.id         = id 
    item.obj        = obj:GetComponent(typeof(Button))
    item.content    = content
    item.gameObjectSelect = gameObjectSelect

    return item
end

function SelectLevelWindow:onClickItem(item)
    for k,v in pairs(self.items) do
        v.gameObjectSelect.gameObject:SetActive(false)
        -- v.content.localScale = Vector3.one
    end
    item.gameObjectSelect.gameObject:SetActive(true)
    -- item.content.localScale = Vector3.one*1.04
    self.selectLevelID = item.id
end
