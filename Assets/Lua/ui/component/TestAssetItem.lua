local TestAssetItem = DClass("TestAssetItem", BaseComponent)
_G.TestAssetItem = TestAssetItem

function TestAssetItem:init()
    self.icon = self.transform:Find("Icon"):GetComponent(typeof(Image))
    local icons = {
        "Icon/Head/10001",
        "Icon/Head/10002",
        "Icon/Head/10003",
        "Icon/Buff/Buff01",
        "Icon/Buff/Buff02",
        "Icon/Buff/Buff03",
        "Icon/ItemIcon/10001",
        "Icon/ItemIcon/10002",
        "Icon/ItemIcon/10003",
        "Icon/SpriteStar/Quality_SSS",
        "Icon/SpriteStar/Quality_SS",
        "Icon/SpriteStar/Quality_S",
        "Icon/SpriteStar/Quality_A",
        "Icon/SpriteStar/Quality_B",
        "Icon/ItemQuality/Quality_Big01",
        "Icon/ItemQuality/Quality_Big02",
        "Icon/ItemQuality/Quality_Big03",
        "Icon/ItemQuality/Quality_Big04",
        "Icon/ItemQuality/Quality_Big05",
    }
    self:setSprite(self.icon, icons[math.random(1,#icons)])
end