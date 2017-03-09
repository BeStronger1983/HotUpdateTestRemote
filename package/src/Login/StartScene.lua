---------------------------
-- StartScene 登入畫面
---------------------------
package.loaded["src/Common/SoundDeal"] = nil
require("src/Common/SoundDeal")

local StartScene = class("StartScene",function()
  return cc.Scene:create()
end)
 
function StartScene.create()
  local loginScene = StartScene.new()
  loginScene:addChild(loginScene:createText())
  return loginScene
end

function StartScene:ctor()
end

function StartScene:createText()
  local text = cc.Label:createWithSystemFont("StartScene After HotUpdate", "Arial", 96)
  text:setTextColor(cc.c4b(255, 255, 255, 255))
  local contentsize = self:getContentSize()
  text:setPosition(contentsize.width/2, contentsize.height/2)
  return text
end

return StartScene
