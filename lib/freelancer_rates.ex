defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * discount / 100
  end

  def monthly_rate(hourly_rate, discount) do
    monthly_rate_before_discount = hourly_rate * 8 * 22

    trunc(
      Float.ceil(monthly_rate_before_discount - monthly_rate_before_discount * discount / 100)
    )
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate_before_discount = hourly_rate * 8

    daily_rate_after_discount =
      daily_rate_before_discount - daily_rate_before_discount * discount / 100

    Float.floor(budget / daily_rate_after_discount, 1)
  end
end
