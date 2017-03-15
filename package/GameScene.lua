---------------------------
-- GameScene
---------------------------
local GameScene = class("GameScene",function()
  return cc.Scene:create()
end)
 
function GameScene.create()
  local scene = GameScene.new()
  return scene
end

function GameScene:ctor()
  self.m_mainNode = cc.CSLoader:createNode("res/HotUpdateTest/GameScene.csb")
  self:addChild(self.m_mainNode)
  self:initToStartSceneButton()
  self:initText()
  self:initImage()
end

function GameScene:initToStartSceneButton()
  self.m_mainNode:getChildByName("btnToStartScene"):addTouchEventListener(function (event,type)
    if type == ccui.TouchEventType.ended then
      local startScenePath = "src/HotUpdateTest/StartScene"
      package.loaded[startScenePath] = nil
      Utility:switchScene(require(startScenePath).create())
    end
  end)
end

function GameScene:initText()
  self.m_text = self.m_mainNode:getChildByName("lblGameScene")
  self.m_text:setString("After Hot Update")
end

function GameScene:initImage()
  debug_print("GameScene:initImage()")
  self.m_image = self.m_mainNode:getChildByName("spriteGameScene")
  debug_print("GameScene:initImage() before imagePath")
  local imagePath = cc.FileUtils:getInstance():getWritablePath() .. "package/banker.png"
  debug_print("imagePath = ", imagePath)

  local isImageExist = cc.FileUtils:getInstance():isFileExist(imagePath)
  debug_print("isImageExist = ", isImageExist)

  if not isImageExist then
    imagePath = "res/RoadMap/banker.png"
  end

  self.m_image:setTexture(imagePath)
end

return GameScene
