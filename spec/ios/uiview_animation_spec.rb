describe "UIView animation methods" do
  before do
    @view = UIView.alloc.initWithFrame([[1,2],[3,4]])
  end

  it 'should delta_to x:1 y:2' do
    @view.delta_to([1,2]).frame.should == CGRectMake(2,4,3,4)
  end

  it 'should resize_to w:5 h:6' do
    @view.resize_to([5,6]).frame.should == CGRectMake(1,2,5,6)
  end

  it 'should reframe_to x:2 y:4 w:5 h:6' do
    @view.reframe_to([[2,4],[5,6]]).frame.should == CGRectMake(2,4,5,6)
  end

  it 'should move_to x:2 y:4' do
    @view.move_to([2,4]).frame.should == CGRectMake(2,4,3,4)
  end

  it 'should center_to x:2 y:4' do
    @view.center_to([2,4]).center.should == CGPointMake(2,4)
  end

  it 'should scale to 4' do
    radians = Math.atan2(@view.transform.b,
                         @view.transform.a)
    new_view = @view.scale_to(4)
    new_radians = Math.atan2(new_view.transform.b,
                             new_view.transform.a)
    radians.should == new_radians
    new_view.transform.a.should == 4.to_f
    new_view.transform.d.should == 4.to_f
  end

  it 'should scale to x:4 y:3' do
    radians = Math.atan2(@view.transform.b,
                         @view.transform.a)
    new_view = @view.scale_to([4, 3])
    new_radians = Math.atan2(new_view.transform.b,
                             new_view.transform.a)
    radians.should == new_radians
    new_view.transform.a.should == 4.to_f
    new_view.transform.d.should == 3.to_f
  end

  it 'should rotate 45 degrees' do
    angle = 45.degrees
    @view.rotate_to(angle)
    current_angle = Math.atan2(@view.transform.b, @view.transform.a)
    current_angle.should == angle
  end

  it 'should rotate 45 degrees and then 45 degrees again' do
    angle = 45.degrees
    @view.rotate_to(angle)
    @view.rotate(angle)
    current_angle = Math.atan2(@view.transform.b, @view.transform.a)
    current_angle.should == 90.degrees
  end

  it 'should animate anything' do
    UIView.animate {
      @view.frame = [[0, 0], [0, 0]]
    }
    CGRectEqualToRect(@view.frame, [[0, 0], [0, 0]]).should == true
  end

  it 'should call the after block anything' do
    @after_called = false
    UIView.animate(after:->{ @after_called = true }, duration: 0.05) {
      @view.frame = [[0, 0], [0, 0]]
      @after_called = :animating
    }
    @after_called.should == :animating
    wait 0.1 {
      @after_called.should == true
    }
  end

  it 'should animate if duration is 0 and delay > 0' do
    @after_called = false
    UIView.animate(after:->{ @after_called = true }, duration: 0.0, delay: 0.1) {
      @view.frame = [[0, 0], [0, 0]]
      @after_called = :animating
    }
    @after_called.should == :animating
    wait 0.1 {
      @after_called.should == true
    }
  end

  it 'should not animate if duration is 0' do
    @after_called = false
    UIView.animate(after:->{ @after_called = true }, duration: 0.0) {
      @view.frame = [[0, 0], [0, 0]]
      @after_called = :animating
    }
    @after_called.should == true
  end

  it 'should not animate if duration is 0, and after: is not required' do
    @after_called = false
    UIView.animate(duration: 0.0) {
      @view.frame = [[0, 0], [0, 0]]
      @after_called = true
    }
    @after_called.should == true
  end

  it 'should have sugarcube_animation_options helper' do
    UIView.sugarcube_animation_options({}).should == (UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState)
  end

  it 'should handle accept :options' do
    UIView.sugarcube_animation_options(options: UIViewAnimationOptionCurveLinear).should == UIViewAnimationOptionCurveLinear
    UIView.sugarcube_animation_options(options: UIViewAnimationOptionCurveLinear | UIViewAnimationOptionCurveEaseInOut).should == UIViewAnimationOptionCurveLinear | UIViewAnimationOptionCurveEaseInOut
  end

  it 'should accept :curve' do
    opts = UIView.sugarcube_animation_options(curve: UIViewAnimationOptionCurveLinear)
    (opts & UIViewAnimationOptionCurveLinear).should == UIViewAnimationOptionCurveLinear

    opts = UIView.sugarcube_animation_options(curve: :linear)
    (opts & UIViewAnimationOptionCurveLinear).should == UIViewAnimationOptionCurveLinear
  end

  it 'should accept :from_current' do
    opts = UIView.sugarcube_animation_options(from_current: true)
    (opts & UIViewAnimationOptionBeginFromCurrentState).should == UIViewAnimationOptionBeginFromCurrentState
    opts = UIView.sugarcube_animation_options(from_current: false)
    (opts & UIViewAnimationOptionBeginFromCurrentState).should == 0
  end

  it 'should accept :allow_interaction' do
    opts = UIView.sugarcube_animation_options(allow_interaction: true)
    (opts & UIViewAnimationOptionAllowUserInteraction).should == UIViewAnimationOptionAllowUserInteraction
    opts = UIView.sugarcube_animation_options(allow_interaction: false)
    (opts & UIViewAnimationOptionAllowUserInteraction).should == 0
  end

  it 'should have a forward_fiend! animation' do
    -> do
      @view.forward_fiend!
    end.should.not.raise
  end

  it 'should have a back_fiend! animation' do
    -> do
      @view.back_fiend!
    end.should.not.raise
  end

  it 'should have a wiggle animation' do
    -> do
      @view.wiggle
    end.should.not.raise
  end

  it 'should have a dont_wiggle method' do
    -> do
      @view.dont_wiggle
    end.should.not.raise
  end

end
