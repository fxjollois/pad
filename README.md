# pad: Point Anomaly Detection

The purpose of the `pad` package is to propose a large method to detect point anomalies in a univariate time-serie. A point anomaly is a particular element, far enough to its neighborhood to be considered as an outlier.

## TODO List

- Implement following methods:
    - Prediction Models:
        - an average of all the points in the cluster that the value at time t maps to [Hill and Minsker, 2010], 
            - Hill, D. J. and Minsker, B. S. (2010). Anomaly Detection in Streaming Environmental Sensor Data: A Data-driven Modeling Approach. Environmental Modelling and Software, 25(9):1014–1022. DOI: 10.1016/j.envsoft.2009.08.010. 17, 21, 77, 78
            - Hill, D. J., Minsker, B. S., and Amir, E. (2007). Real-time Bayesian Anomaly Detection for En- vironmentalSensorData.InProc.ofthe32nd Conf.ofIntl.AssociationofHydraulicEngineering and Research (IAHR). DOI: 10.1029/2008WR006956. 17, 21, 27, 77
        - using regression models. 
        - Single-layer linear network predictor (or AR model) has been used in a large number of studies including [Hill and Minsker, 2010]. 
            - cf plus haut
        - Other prediction models include Multi-layer percep- tron (MLP) predictor [Hill and Minsker, 2010] 
            - idem
        - and support vector regression [Ma and Perkins, 2003a]. 
           - Ma, J. and Perkins, S. (2003a). Online Novelty Detection on Temporal Sequences. In Proc. of the 9th ACM Intl. Conf on Knowledge Discovery and Data Mining (KDD), pages 613–618. DOI: 10.1145/956750.956828. 17
        - Mixture transition distribution (MTD) have been proposed for outlier detection for gen- eral non-Gaussian time series [Le et al., 1996]. 
            - Le, N. D., Martin, R. D., and Raftery, A. E. (1996). Modeling Flat Stretches, Bursts, and Outliers in Time Series Using Mixture Transition Distribution Models. Journal of the American Statistical Association, 91(436):1504–1515. DOI: 10.1080/01621459.1996.10476718. 17
        - [Tsay et al., 2000] propose a vector ARIMA model to identify additive outliers, innovation outliers, level shifts, and temporary changes from multi-variate time series.
            - Tsay, R. S., Pena, D., and Pankratz, A. E. (2000). Outliers in Multivariate Time Series. Biometrika, 87(4):789–804. DOI: 10.1093/biomet/87.4.789. 17
        - Besides individual points, multiple outliers can also be discovered us- ing prediction models, e.g., using re-weighted maximum likelihood estimates [Luceno, 1998] 
            - Luceno, A. (1998). Detecting Possibly Non-Consecutive Outliers in Industrial Time Series. Journal of the Royal Statistical Society. Series B (Statistical Methodology), 60(2):295–310. DOI: 10.1111/1467-9868.00126. 17
        - or using Gibbs sampling and block interpolation [Justel et al., 2001].
            - Justel, A., Pena, D., and Tsay, R. S. (2001). Detection of Outlier Patches in Autoregressive Time Series. Statistica Sinica, 11(3):651–674. 17
        - Outlier-aware variants of these prediction models estimate model parameters and outliers together [Bianco et al., 2001], [Chang et al., 1988], [Chen and Liu, 1993], [Tsay, 1986]. 
            - Bianco, A. M., García Ben, M., Martínez, E. J., and Yohai, V. J. (2001). Outlier Detection in Regression Models with ARIMA Errors Using Robust Estimates. Journal of Forecasting, 20(8):565–579. DOI: 10.1002/for.768. 18
            - Chang, I., Tiao, G. C., and Chen, C. (1988). Estimation of Time Series Parameters in the Presence of Outliers. Technometrics, 30(2):193–204. DOI: 10.1080/00401706.1988.10488367. 18
            - Chen, C. and Liu, L.-M. (1993). Joint Estimation of Model Parameters and Outlier Ef- fects in Time Series. Journal of the American Statistical Association, 88(421):284–297. DOI: 10.2307/2290724. 18
            - Tsay, R. S. (1986). Time Series Model Specification in the Presence of Outliers. Journal of the American Statistical Association, 81(393):132–141. DOI: 10.1080/01621459.1986.10478250. 18
        - In multi-variate time series, prediction could be made for all con- stituent time series. In [Galeano et al., 2006], to compute outliers for multi-variate time series, testing for outliers is done only in some smartly selected projection directions rather than testing the multivariate series directly to compute outliers.
           - Galeano, P., Peña, D., and Tsay, R. S. (2006). Outlier Detection in Multivariate Time Series by Projection Pursuit. Journal of the American Statistical Association, 101(474):654–669. DOI: 10.1198/016214505000001131. 18
    - Profile Similarity-Based Approaches:
        - ese approaches maintain a normal profile and then compare a new time point against this profile to decide whether it is an outlier. 
        - for multiple OS performance metric time series, the Tiresias system [Williams et al., 2007] main- tains a normal profile and also a variance vector. Any new data point is compared both with the normal profile and the variance vector to compute its anomaly score. Here the profile is the actual smoothed time series data from past data. 
            - Williams, A. W., Pertet, S. M., and Narasimhan, P. (2007). Tiresias: Black-box Failure Prediction in Distributed Systems. In Proc. of the 21st Intl. Parallel and Distributed Processing Symposium (IPDPS), pages 1–8. DOI: 10.1109/IPDPS.2007.370345. 18
        - In [Silvestri et al., 1994], a neural network is used to maintain the normal profile and an estimation is made for the next value in the sensor stream based on this profile. We will discuss more profile-based techniques in Chapter 3 in the context of data streams.
            - Silvestri, G., Verona, F., Innocenti, M., and Napolitano, M. (1994). Fault Detection using Neural Networks. In Proc. of the 1994 IEEE Intl. Conf. on Neural Networks, volume 6, pages 3796– 3799. DOI: 10.1109/ICNN.1994.374815. 18
    - Deviants 
        - Deviants are outlier points in time series from a minimum description length (MDL) point of view [Jagadish et al., 1999]. 
            - Jagadish, H. V., Koudas, N., and Muthukrishnan, S. (1999). Mining Deviants in a Time Series Database. In Proc. of the 25th Intl. Conf. on Very Large Data Bases (VLDB), pages 102–113. DOI: 10.1109/SSDM.2004.1311192. 18
        - If the removal of a point P from the time sequence results in a sequence that can be represented significantly more succinctly than the original one, then the point P is a deviant. ese information-theoretic models explore the space-deviation tradeoff by fixing the deviation, rather than fixing the space, as in conventional models. us, the problem is to find points whose removal results in a histogram representation with a lower error bound than the original, even after the number of buckets has been reduced to account for the separate storage of these deviant points. 
        - [Jagadish et al., 1999] propose a dynamic programming mechanism to solve the problem.
            - voir plus haut
        - [Muthukrishnan et al., 2004] make the observation that for any bucket, the optimal set of k deviants within the bin always consists of the l highest and remaining k 􏰌 l lowest values for some l 􏰏 k. en, they propose an approximation to the dynamic programming-based solution that maintains a partial solution only for a few interspersed indexes of the time series rather than for each value.
            - Muthukrishnan, S., Shah, R., and Vitter, J. (2004). Mining Deviants in Time Series Data Streams. In Proc. of the 16th Intl. Conf. on Scientific and Statistical Database Management (SS- DBM), pages 41–50. DOI: 10.1109/SSDBM.2004.51. 18
- See *clustering and classification approaches, described in Section 2.1.1, that can also be used to detect point outliers*
- Add sample time series
- Develop a shiny interface