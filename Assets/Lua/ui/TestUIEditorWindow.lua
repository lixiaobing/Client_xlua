---@class TestUIEditorWindow
local TestUIEditorWindow = {}

---__BINDING_FUNCTIONS_BEGIN__
---__BINDING_FUNCTIONS_END____

---__BINDING_ELEMENTS_BEGIN__
---@自动生成代码不要修改否则覆盖!!!!!!
---@自动生成代码不要修改否则覆盖!!!!!!
---@自动生成代码不要修改否则覆盖!!!!!!
function TestUIEditorWindow:BindingElements(wndNode)
	local temp3315073009287403660 = wndNode:Find('Panel')
	self.panelGameObject = temp3315073009287403660.gameObject
	self.panelRectTransform = temp3315073009287403660
	self.panelCanvasRenderer = temp3315073009287403660:GetComponent(typeof(CanvasRenderer))
	self.panelImage = temp3315073009287403660:GetComponent(typeof(Image))
	local temp3315073010138456566 = wndNode:Find('Text')
	self.textGameObject = temp3315073010138456566.gameObject
	self.textRectTransform = temp3315073010138456566
	self.textCanvasRenderer = temp3315073010138456566:GetComponent(typeof(CanvasRenderer))
	self.textText = temp3315073010138456566:GetComponent(typeof(Text))
	local temp3315073011115980059 = wndNode:Find('Image')
	self.imageGameObject = temp3315073011115980059.gameObject
	self.imageRectTransform = temp3315073011115980059
	self.imageCanvasRenderer = temp3315073011115980059:GetComponent(typeof(CanvasRenderer))
	self.imageImage = temp3315073011115980059:GetComponent(typeof(Image))
	local temp3315073009562511584 = wndNode:Find('Image/Button123')
	self.button123GameObject = temp3315073009562511584.gameObject
	self.button123RectTransform = temp3315073009562511584
	self.button123CanvasRenderer = temp3315073009562511584:GetComponent(typeof(CanvasRenderer))
	self.button123Image = temp3315073009562511584:GetComponent(typeof(Image))
	self.button123Button = temp3315073009562511584:GetComponent(typeof(Button))
	local temp3315073009341017260 = wndNode:Find('Image/Button123/Text123')
	self.text123GameObject = temp3315073009341017260.gameObject
	self.text123RectTransform = temp3315073009341017260
	self.text123CanvasRenderer = temp3315073009341017260:GetComponent(typeof(CanvasRenderer))
	self.text123Text = temp3315073009341017260:GetComponent(typeof(Text))
	local temp3315073009292927990 = wndNode:Find('Toggle')
	self.toggleGameObject = temp3315073009292927990.gameObject
	self.toggleRectTransform = temp3315073009292927990
	self.toggleToggle = temp3315073009292927990:GetComponent(typeof(Toggle))
end
---__BINDING_ELEMENTS_END____