require "day_four/guard"
require "time"

describe DayFour::Guard do

  let(:guard) { DayFour::Guard.new(1) }

  it "returns id" do
    expect(guard.id).to eq(1)
  end

  it "adds up the sleep duration" do
    guard.sleep(Time.parse("[1518-11-01 00:01]"))
    guard.wake(Time.parse("[1518-11-01 00:05]"))
    expect(guard.sleep_duration).to eq(4)
  end

  it "adds up the sleep duration for different days" do
    guard.sleep(Time.parse("[1518-11-01 00:01]"))
    guard.wake(Time.parse("[1518-11-01 00:09]"))
    guard.sleep(Time.parse("[1518-12-01 00:08]"))
    guard.wake(Time.parse("[1518-12-01 00:09]"))
    expect(guard.sleep_duration).to eq(9)
  end

  it "most asleep minute is 8" do
    guard.sleep(Time.parse("[1518-11-01 00:01]"))
    guard.wake(Time.parse("[1518-11-01 00:09]"))
    guard.sleep(Time.parse("[1518-12-01 00:08]"))
    guard.wake(Time.parse("[1518-12-01 00:09]"))
    expect(guard.most_asleep_minute).to eq(8)
  end

  it "most asleep minute occurence is 2" do
    guard.sleep(Time.parse("[1518-11-01 00:01]"))
    guard.wake(Time.parse("[1518-11-01 00:09]"))
    guard.sleep(Time.parse("[1518-12-01 00:08]"))
    guard.wake(Time.parse("[1518-12-01 00:09]"))
    expect(guard.most_asleep_minute_occurence).to eq(2)
  end

  it "returns nil for most asleep minute guard hasn't slept" do
    expect(guard.most_asleep_minute).to be_nil
  end

  it "returns 0 for occurence when guard hasn't slept" do
    expect(guard.most_asleep_minute_occurence).to eq(0)
  end

  it "returns 0 for sleep duration when guard hasn't slept" do
    expect(guard.sleep_duration).to eq(0)
  end

end