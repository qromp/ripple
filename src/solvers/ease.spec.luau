return function()
    local createMotion = require(script.Parent.Parent.createMotion)
    local ease = require(script.Parent.ease)
    local curves = require(script.Parent.Parent.curves)

    it("should animate a value", function()
        local motion = createMotion(0)

        motion:to(ease(1, { duration = 1, easingStyle = curves.curveLinear }))
        motion:step(0.5)

        expect(math.round(motion:get()*100)/100).to.equal(0.5)
        expect(motion:isComplete()).to.equal(false)

        motion:step(0.5)

        expect(motion:get()).to.equal(1)
        expect(motion:isComplete()).to.equal(true)
    end)

    it("should animate multiple values", function()
        local motion = createMotion({ x = 0, y = 0 })

        motion:to(ease({ x = 1, y = 1 }, { duration = 1, easingStyle = curves.curveLinear }))
        motion:step(0.5)

        expect(motion:get().x).to.equal(0.5)
        expect(motion:get().y).to.equal(0.5)
        expect(motion:isComplete()).to.equal(false)

        motion:step(0.5)

        expect(motion:get().x).to.equal(1)
        expect(motion:get().y).to.equal(1)
        expect(motion:isComplete()).to.equal(true)
    end)
end
