# Experiment Design

## Unit of Diversion (provided by Udacity)

The unit of diversion is a cookie, although if the student enrolls in the free trial, they are tracked by user-id from that point forward. The same user-id cannot enroll in the free trial twice. For users that do not enroll, their user-id is not tracked in the experiment, even if they were signed in when they visited the course overview page.

## Initial Hypothesis (Provided by Udacity)

The hypothesis was that this might set clearer expectations for students upfront, thus reducing the number of frustrated students who left the free trial because they didn't have enough time—without significantly reducing the number of students to continue past the free trial and eventually complete the course. If this hypothesis held true, Udacity could improve the overall student experience and improve coaches' capacity to support students who are likely to complete the course. 

# Metric Choice

## Choosing Invariant Metrics

Invariant Metrics are the metrics which should not change across control and experiment groups during the course of the experiment.

- Number of cookies
- Number of clicks
- Click-through-probability

## Choosing Evaluation Metrics

Evaluation metrics were chosen since there is the possibility of different distributions between experiment and control groups as a function of the experiment. Each evaluation metric is associated with a minimum difference (dmin) that must be observed for consideration in the decision to launch the experiment. The ultimate goal is to minimize student frustration and satisfaction and to most effectively use limited coaching resources. Cancelling early may be one indication of frustration or low satisfaction and the more students enrolled in the course who do not make at least one payment, much less finish the course, the less coaching resources are being used effectively. With this in mind, in order to consider launching the experiment either of the following must be observed:

- Gross conversion: we expect this metric will be decreased in experiment group. (users get the question and will have a second to consider enroll or not, this will filter some users who are not willing to checkout after free trial period).

- Retention: we expect this metric will be increased in experiment group. (more students staying beyond the free trial in the experiment group).

- Net conversion: we expect this metric will be increased in experiment group.


# Measuring Variability


Metrics | Estimator | dmin | Standard Deviation | Scaled Estimator | samplesize
--- | --- | --- | --- | --- | ---
cookies | 40000 | 3000 | NaN | 5000 | NaN	
cliks | 3200 | 240 | NaN | 400 | NaN
user-id | 660 | -50 | NaN | 82.5 | NaN
click-through-probability | 0.080000 | 0.0100 | NaN | NaN | NaN
gross conversion | 0.206250 | -0.0100 | 0.020231 | NaN | 645875.0
retention | 0.206250 | 0.0100 | 0.054949 | NaN | 4741212.0
net conversion | 0.206250 | 0.0075 | 0.015602 | NaN | 685325.0

# Sizing
## Choosing Number of Samples given Power
Use an alpha of 0.05 and a beta of 0.2. Make sure you have enough power for each metric.   
And we applied an online caculator to calculate the sample size: https://www.evanmiller.org/ab-testing/sample-size.html


### Gross Conversion
- Baseline Conversion: 20.625%   
- Minimum Detectable Effect: 1%   
- alpha: 5%   
- beta: 20%   
- 1 - beta: 80%   
- sample size = 25,835 enrollments/group   
- Number of groups = 2 (experiment and control)   
- total sample size = 51,670 enrollments   
- clicks/pageview: 3200/40000 = .08 clicks/pageview   
- pageviews = 645,875   
### Retention
- Baseline Conversion: 53%   
- Minimum Detectable Effect: 1%   
- alpha: 5%   
- beta: 20%   
- 1 - beta: 80%   
- sample size = 39,155 enrollments/group   
- Number of groups = 2 (experiment and control)   
- total sample size = 78,230 enrollments   
- enrollments/pageview: 660/40000 = .0165 enrollments/pageview   
- pageviews = 78,230/.0165 = 4,741,212   
### Net Conversion
- Baseline Conversion: 10.9313%   
- Minimum Detectable Effect: .75%   
- alpha: 5%   
- beta: 20%   
- 1 - beta: 80%   
- sample size = 27,413 enrollments/group   
- Number of groups = 2 (experiment and control)   
- total sample size = 54,826   
- clicks/pageview: 3200/40000 = .08 clicks/pageview   
- pageviews = 685,325   


Metrics | Estimator | dmin | Standard Deviation | Scaled Estimator | samplesize
--- | --- | --- | --- | --- | ---
cookies | 40000 | 3000 | NaN | 5000 | NaN	
cliks | 3200 | 240 | NaN | 400 | NaN
user-id | 660 | -50 | NaN | 82.5 | NaN
click-through-probability | 0.080000 | 0.0100 | NaN | NaN | NaN
gross conversion | 0.206250 | -0.0100 | 0.020231 | NaN | 645875.0
retention | 0.206250 | 0.0100 | 0.054949 | NaN | 4741212.0
net conversion | 0.206250 | 0.0075 | 0.015602 | NaN | 685325.0


## Choosing Duration vs. Exposure
If we divert 100% of traffic, given 40,000 page views per day, the experiment would take ~ 119 days. If we eliminate retention, we are left with Gross Conversion and Net Conversion. This reduces the number of required pageviews to 685,325, and an ~ 18 day experiment with 100% diversion and ~ 35 days given 50% diversion.   

We see that we would need to run the experiment for about 119 days in order to test all three hypotheses (and this does not even take into account the 14 additional days (free trial period) we have to wait until we can evaluate the experiment). Such a duration (esp. with 100% traffic diverted to it) appears to be very risky. First, we cannot perfom any other experiment during this period (opportunity costs). Secondly, if the treatment harms the user experience (frustrated students, inefficient coaching resources) and decreases conversion rates, we won't notice it (or cannot really say so) for more than four months (business risk). Consequently, it seems more reasonable to only test the first and third hypothesis and to discard retention as an evaluation metric. Especially since net conversion is a product of rentention and gross conversion, so that we might be able to draw inferences about the retention rate from the two remaining evaluation metrics.   

So, how much traffic should we divert to the experiment? Given the considerations above, we want the experiment to run relatively fast and for not more than a few weeks. Also, as the nature of the experiment itself does not seem to be very risky (e.g. the treatment doesn't involve a feature that is critical with regards to potential media coverage), we can be confident in diverting a high percentage of traffic to the experiment. Still, since there is always the potential that something goes wrong during implemention, we may not want to divert all of our traffic to it. Hence, 80% (22 days) would seem to be quite reasonable. However, when we look at the data provided by Udacity (see 4.1) we see that it takes 37 days to collect 690,203 pageviews, meaning that they most likely diverted somewhere between 45% and 50% of their traffic to the experiment.

for the experiment using 50% traffic with gross conversion and net conversion, we need:  34  days
for the experiment using 45% traffic with gross conversion and net conversion, we need:  38  days

It seems that 38 days are little bit longer, so we will divert 50% traffic for the experiment with gross conversion and net conversion.

# Analysis

## Sanity Checks
Start by checking whether your invariant metrics are equivalent between the two groups.


Metrics | CI_lower | CI_upper | obs  | passes or not
--- | --- | --- | --- | ---
Cookies | 0.49882 | 0.50118 | 0.500640 | 1
Clicks | 0.495884 | 0.504116 | 0.500467 | 1
CTP | -0.001296 | 0.001296 | -0.000057 | 1


# Check for Practical and Statistical Significance

Next, for your evaluation metrics, calculate a confidence interval for the difference between the experiment and control groups, and check whether each metric is statistically and/or practically significance. A metric is statistically significant if the confidence interval does not include 0 (that is, you can be confident there was a change), and it is practically significant if the confidence interval does not include the practical significance boundary (that is, you can be confident there is a change that matters to the business.)

Metrics | CI_lower | CI_upper | obs  | stats_sig?  | dmin | prac_sig?
--- | --- | --- | --- | --- | --- | --- | ---
Gross_Conversion | -0.02912 | -0.011989	 | -0.020555 | 1 | -0.0100 | 1
Net_Conversion | -0.011604	 | 0.001857 | -0.004874	 | 0 | 0.0075 | 0 

