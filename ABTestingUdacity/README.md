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

Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3