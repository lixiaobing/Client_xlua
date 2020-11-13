local setmetatable = setmetatable
local UpdateBeat = UpdateBeat
local CoUpdateBeat = CoUpdateBeat
local Time = Time

Timer = {}

local Timer = Timer
local mt = {__index = Timer}

--unscaled false 采用deltaTime计时，true 采用 unscaledDeltaTime计时
function Timer.new(func, duration, loop, unscaled)
	unscaled = unscaled or false and true	
	loop = loop or 1
	return setmetatable({func = func, duration = duration, time = duration, loop = loop, unscaled = unscaled, running = false}, mt)	
end

function Timer:start()
	self.running = true

	if not self.handle then
		self.handle = UpdateBeat:add(self.update, self)
	end

	UpdateBeat:add(self.handle)	
end

function Timer:reset(func, duration, loop, unscaled)
	self.duration 	= duration
	self.loop		= loop or 1
	self.unscaled	= unscaled
	self.func		= func
	self.time		= duration
end

function Timer:stop()
	self.running = false

	if self.handle then
		UpdateBeat:remove(self.handle)	
	end
end

function Timer:update()
	if not self.running then
		return
	end

	local delta = self.unscaled and Time.unscaledDeltaTime or Time.deltaTime	
	self.time = self.time - delta
	
	if self.time <= 0 then
		self.func()
		
		if self.loop > 0 then
			self.loop = self.loop - 1
			self.time = self.time + self.duration
		end
		
		if self.loop == 0 then
			self:Stop()
		elseif self.loop < 0 then
			self.time = self.time + self.duration
		end
	end
end

--给协同使用的帧计数timer
FrameTimer = {}

local FrameTimer = FrameTimer
local mt2 = {__index = FrameTimer}

function FrameTimer.new(func, count, loop)	
	local c = Time.frameCount + count
	loop = loop or 1
	return setmetatable({func = func, loop = loop, duration = count, count = c, running = false}, mt2)		
end

function FrameTimer:reset(func, count, loop)
	self.func = func
	self.duration = count
	self.loop = loop
	self.count = Time.frameCount + count	
end

function FrameTimer:start()		
	if not self.handle then
		self.handle = CoUpdateBeat:add(self.Update, self)
	end
	self.running = true
end

function FrameTimer:stop()	
	self.running = false

	if self.handle then
		CoUpdateBeat:remove(self.handle)
	end
end

function FrameTimer:update()	
	if not self.running then
		return
	end

	if Time.frameCount >= self.count then
		self.func()	
		
		if self.loop > 0 then
			self.loop = self.loop - 1
		end
		
		if self.loop == 0 then
			self:Stop()
		else
			self.count = Time.frameCount + self.duration
		end
	end
end

CoTimer = {}

local CoTimer = CoTimer
local mt3 = {__index = CoTimer}

function CoTimer.new(func, duration, loop)	
	loop = loop or 1
	return setmetatable({duration = duration, loop = loop, func = func, time = duration, running = false}, mt3)			
end

function CoTimer:start()		
	if not self.handle then	
		self.handle = CoUpdateBeat:add(self.ppdate, self)
	end
	
	self.running = true
end

function CoTimer:reset(func, duration, loop)
	self.duration 	= duration
	self.loop		= loop or 1	
	self.func		= func
	self.time		= duration		
end

function CoTimer:stop()
	self.running = false

	if self.handle then
		CoUpdateBeat:remove(self.handle)	
	end
end

function CoTimer:update()	
	if not self.running then
		return
	end

	if self.time <= 0 then
		self.func()		
		
		if self.loop > 0 then
			self.loop = self.loop - 1
			self.time = self.time + self.duration
		end
		
		if self.loop == 0 then
			self:stop()
		elseif self.loop < 0 then
			self.time = self.time + self.duration
		end
	end
	
	self.time = self.time - Time.deltaTime
end