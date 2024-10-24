<?php
try {

	apiLogWrite("\n\n========$PageName=======Called (" . date('Y_m_d_H_i_s') . ")===================");
	apiLogWrite("Params (" . date('Y_m_d_H_i_s') . "): " . json_encode($data));

	$db = new Db();

	$TransactionId = isset($data['SalesForceCustomerVisitID']) ? checkNull($data['SalesForceCustomerVisitID']) : null;
	$UserId = isset($data['UserInfoID']) ? checkNull($data['UserInfoID']) : null;
	$ContactPersonName = isset($data['ContactPersonName']) ? checkNull($data['ContactPersonName']) : null;
	$ContactPersonDesignation = isset($data['ContactPersonDesignation']) ? checkNull($data['ContactPersonDesignation']) : null;
	$ContactPersonMobileNumber = isset($data['ContactPersonMobileNumber']) ? checkNull($data['ContactPersonMobileNumber']) : NULL;
	$SelfDiscussion = isset($data['SelfDiscussion']) ? checkNull($data['SelfDiscussion']) : null;
	$SelfFBVisitActions = isset($data['SelfFBVisitActions']) ? $data['SelfFBVisitActions'] : [];
	$SelfFBVisitMachineParts = isset($data['SelfFBVisitMachineParts']) ? $data['SelfFBVisitMachineParts'] : [];
	$SelfFollowUpDate = isset($data['SelfFollowUpDate']) ? convertAppToDBDate(checkNull($data['SelfFollowUpDate'])) : null; //'20-Aug-2024'
	
	$customerBySuggestion = isset($data['customerBySuggestion']) ? checkNull($data['customerBySuggestion']) : null;
	$customerSignature = isset($data['customerSignature']) ? checkNull($data['customerSignature']) : null;
	$customerSignatureUrl = null;
	$customerToSuggestion = isset($data['customerToSuggestion']) ? checkNull($data['customerToSuggestion']) : null;
	
	$IsVisitorFeedback = "Y";



	if($customerSignature){
		// $customerSignature = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAjoAAAEMCAYAAADNgxztAAAAAXNSR0IArs4c6QAAAARzQklUCAgI\nCHwIZIgAACAASURBVHic7d17eFN1nsfxb9KmLVTacJEdy63lzkpbBPGyFgZ2HlGqIrIIousdxVHA\nEdlB8DIzoALiikNZGWcYQFe0LDrOiFRQZmBoQRaRQgW8IJKqqAi1oaDFtjT7B0OXnHOSJk1yTvI7\n79fz+Dye30nO+XJLPv2d38Xh8\/l8oqBbb71VXnzxxabjSZMmye9+9zsLK4qO\/v37y969e\/3aunfv\nLgcOHLCoovjxwgsvyPTp0+Xo0aNNbU6nUwYPHizbtm2zsDIkgvnz58tDDz0U0muXLVsmt99+e4wr\nAhANDlWDTnFxsUyYMKHpuF+\/frJv3z4LK4rcqlWr5IYbbvBrczqdUlVVJW6326KqrFdUVCTTpk2T\nhoaGgK9JSUmRTz75RLp162ZiZUgkrVq1kpMnTzb7uhEjRsj69etNqAhANDitLiBWtIHgiy++sKiS\n6PB6vXLTTTfp2u+\/\/35bh5y5c+fK1KlTg4YcEZG6ujrJycmRiooKkypLbMXFxeLxeKwuwzSlpaUh\nhRyn00nIARKMskFH5PQjnTNOnDiR0F9yBQUFcurUKb82p9MpzzzzjEUVWW\/16tUya9askF\/v8\/lk\nwIABUllZGcOqEpfX65W+ffuKw+GQCRMmSE5OjjgcDhk5cqR4vV6ry4upu+++O6TXrV27NsaVAIg2\npYNObm6u3\/Ebb7xhUSWRKSsr043LERH513\/9VwuqiQ9er1fGjx8f9vt8Pp9cfPHFMago8XXu3Fk+\n\/vhjXfu6deukR48eSoedTz75pNnXLFq0SK688koTqgEQTUoHncLCQr\/jN99806JKInPVVVcZti9d\nutTkSuLH4MGDpaXDyw4fPiy7du2KckWJ7c4775Tvv\/8+4PnvvvtORowYYWJF5vF6vdLY2Bj0Nbfc\ncotMmTLFpIoARJOyg5FFTn+AtW3btuk4LS1NamtrLawofBUVFZKfn69rb926ddAvJpWtWLEi4hkv\n\/fv3lw8++CBKFSW+9PR0+eGHH5p93e7duyUvL8+EisxTVFQkU6dODXje5XJJXV2diRUBiCale3Tc\nbrekpaU1HZ88eTLhut+1vVJnzJs3z+RK4kewL6VQ7dmzR5YtWxaFatQQykBcEZGBAwfGuBLz\/eEP\nfwh6\/s477zSpEgCxoHTQERHp27ev3\/Hjjz9uUSXhKy0tlUOHDunaU1JSbNuNXlpaKsePH4\/KtSZO\nnMjA5DCdOnVK7rjjDqvLiKpga1A5HA5ZsmSJidUAiDblg4528OBf\/vIXiyoJ3z333GPY\/utf\/9rk\nSuLHxIkTg553uVzi8Xikf\/\/+zV7L5\/MF7DGzm3bt2oX82hdeeCGGlZjvxx9\/DHjuggsuMLESALGg\n9BgdEf04HafTqZumHY88Ho\/k5OTo2jMzMxPu8Vs0ORyOoOcOHjzYtCjg4sWL5f777292oGl1dbWt\n1yISEXnsscdkzpw5Ib\/+kksukXfffTeGFZkn2N8pj8fDIpNAglO+R8ftdktycnLTcWNjo2zZssXC\nikLzi1\/8wrBdhW0sWmrdunVBz\/\/P\/\/yP35fS5MmT5dSpU5KSkhL0farOJgrHtGnTxOkM\/eNg27Zt\n8thjj8WwIuslJSURcgAFKN+jIyLSq1cv+fTTT5uOx44dK6tXr7awouYlJSXpeiI6deokX375pUUV\nWW\/QoEGyc+dOw3MXXnihvPfee4bntmzZIgUFBQGvm5SU1OzKynYwdepUKSoqCvn12h60RBWoR8fO\nMxsBlSjfoyMicu211\/odb9q0yaJKQjN58mTDxy0lJSUWVBM\/du\/eHfBcoJAjInLZZZcFHbx96tSp\nhBqkHiuzZ88O6\/U+n0+JjS0DBZ3megIBJAZb9Ohox+mISIsXmzNDamqqbt2O8ePHS3FxsUUVWc9o\nQ9MzRo0aFdIg8549ewacYZMoY7diLTMzU2pqasJ6T2lpadAes3hn1HsqItKhQwc5cuSIBRUBiCZb\n9Oi43W5JSkrya4vXcTrz58\/XhZy0tDRbhxwRCTgexOl0hjwLaMeOHQF\/Sm9sbJTrr7++xfWpYtCg\nQWG\/Z\/jw4Qk9QP7sMXxnC2fMEoD4ZZt\/yV26dPE7\/uMf\/2hRJcE98cQTurannnrKgkriS6C9iK66\n6qqQZ0y53W7ZsGFDwPOvvvpqQn9hR8OoUaPCfk9DQ4NuvSoVtGnTxuoSAESBbYLO2LFj\/Y43b95s\nUSWBlZSU6BbD69ixo20XBzzjrrvuCngunMGzIiJDhgyR888\/P+D5n\/3sZ2FdTzWjR482bL\/00kuD\nvu\/w4cMJ2yMWaPmBYOvrAEgcthijIyJSWVkp2dnZTcfxOKNCOztMRM29hcLVqlUrwy0KWrpfVaD9\nw86wyT+JgIwG5y5cuFD27dvX7HYJFRUVkpubG6vSYiI5OdlwfFaXLl3k888\/t6AiANFkmx6dbt26\n+X2Ah7KBoZkqKip0ISc3N9f2Icfj8QTch6mlu9Hn5eVJ7969A56fMWNGi66rsgsvvFB+\/\/vfN\/uI\navjw4SZVFD2BxuKEs1o0gPhlm6Ajon\/mHk\/7HP32t7\/Vtb300ksWVBJfAi2c2KtXr4jWb\/nf\/\/3f\ngOfsvChjIGdmVb377rtBB+lWVVXJqlWrzCorKlJTUw3bW7dubXIlAGLBVkFnwIABfsfvvPOORZX4\n83q98uKLL\/q15efn2743R0TkjTfeMGx\/9dVXI7qu2+0OOMMo3OnVduJ2u2XNmjVBX3P33XebVE10\nGG21IiK23xYEUIWtgo52XMZbb71lUSX+Zs+erVuZ99lnn7WomvjxyCOPGI6X6dSpU1RC4I4dOwIu\nFrd06dKIr6+qwsJCue+++wKer6mpSagFGAM9xszIyDC5EgCxYKugo93JPNCUZbM9\/\/zzfsfdu3eX\nYcOGWVRN\/Ag0rf7BBx+M2j0mTZpk2B6oJwmnLV68WC677LKA53\/1q1+Jx+MxsaKWGzx4sGG7dpFR\nAInJVkGnsLDQ7yf4b7\/91sJqTisrK9MNjGYw7OnVduvr6w3PPfDAA1G7z5IlSyQ9PV3X3pLZXKoI\ndeuDsrKygGGnsbFR96g4XgVacfvw4cMmVwIgFmwVdEROT1U+Ix4Wh9N+yKalpSXcGIdYCDQIOVgv\nQksZrTrt8XjiarB6tJWVlUlhYaEMHDhQLr30UvnNb37TdC6cnoyysjK55pprDM8dO3YsIaaaBxrU\nfvDgQZMrARALtgs65513XtP\/19XVWR52Dh065Hf885\/\/3KJK4kugHpXnnnsu6ve6+uqrpVevXrr2\nQGEr0U2bNk2GDBkib731lpSXl8u2bdvk17\/+tVx33XUiItK5c2fde4L9O3njjTdk3Lhxhuf27NmT\nEBt\/pqWl6dribQkKAC1ju6DTs2dPv+OysjKLKjm9S\/nZHA6HPPPMMxZVEz8qKioMH1udc845MZuJ\nZjT4e+3atTG5l5VGjBghCxcuNDz35z\/\/WTwej+FaOXv27Al63VWrVkn79u0Nz61YsUJKSkrCL9ZE\nRgOSmX0HqMF2QUf7gfbuu+9aVInIyy+\/7HfcvXt3iyqJL3PmzDFsDzRwOBoKCwv9HmuKiNTX18vi\nxYtjdk8zVVZWSp8+fZpdUsHj8RhugxHKwP1gs9hasoeWmc7u6T2jqqrKgkoARJvtgo52zEBpaakl\ndVRWVkp1dbVf24oVKyypJd4YhU+HwyGPPPJITO87cuRIXdvcuXNjek8z3HHHHdKzZ8+Qworb7TZ8\n1LR169Zm35udnS2\/\/\/3vDc+dOnVK+vfv33yxFrnooot0bYEGwwNILLYLOpdffrnfsVUDDrW7lGdk\nZDStPmt32nFLIqe\/RGO9gJvRY8OvvvoqpveMFa\/XKwMHDhSn0ynLly\/XrdNk5LzzzmuaKaXtmQn1\n92HixIlyxRVXGJ7bu3dv3K6vE6gnyqofhABEj+2Cztkbe4pYN8Vcu0z+jTfeaEkd8Wb+\/PmG7bNm\nzYr5vbt162a4SNzZM5Li3bPPPiudOnWStm3bSnl5ecgblGZkZPiNo9FOMT927FjINaxbty7gTKYn\nn3wyLtfXCbTdQ6QrcAOwnu2Cjoj\/Jn5WdE\/v2rXLb6Cjw+GQJUuWmF5HPAr0+G7ixImm3F+7qKSI\nNLtjt9UqKipk+PDh4nK55IEHHgirFyo5OVmKi4vl2LFjfuvenHvuuX6vO378eFg17dq1S8455xxd\ne21trYwZM8by2Y5agXpT161bZ3IlAKLNlkEnOTm56f99Pp\/pH7oPPfSQ3\/HFF19s6v3jmdGjRDP3\nHDLakPLrr7827f7hmD9\/vqSnp0t+fr5s2rQppMdTZyssLJT6+noZP3687pz297y2tjasa7vdbtmz\nZ49hT0l5eXnQLSSsEGh9phMnTphcCYBos2XQ0c6uMbMr3ev1yl\/\/+le\/tkBbHdjRjz\/+qGu79NJL\nTa0hMzPT77ixsVEqKipMrSEQr9crv\/zlLyUlJUUeeuihsNd6cTgcMnjwYKmurg46fb5r165+xy2Z\nat2tWzfZu3evdOzYUXfu5ZdfNuVxZKTirecJQPhsGXS0S\/7v3LnTtHvPmzfP7yfv9PR0GTJkiGn3\nj2eBAqfZj\/VuvvlmXZvVm3xWVFTI0KFDpV27drJgwYKwH7mmpaXJ2LFjpbGxUbZv395sL1mPHj38\njsPt0TkjOztb1q9fb7itxNy5cw170Kxy9iPtM+rq6iyoBEA02TLoaH9i\/\/777027t\/YL85JLLjHt\n3vHuz3\/+s67N6XQGHNgaK0VFRbpZOFbNvikrK5OuXbtKfn6+lJaWhjy4WEQkKytLpk+fLj6fT2pr\na2X16tUhv1f7w4BRT1uoBgwYIMuWLTM8N2HChLjpLdP29IqcnhYPILHZMuhoB0ma1aNTVlamW4Ts\nrrvuMuXeicBox\/CsrCwLKtGvoG32vlerV6+WrKwsGTJkiHzxxRchvy8pKUkuv\/xyOXjwoBw6dEgW\nLFjQovtrN+QMd\/yP1k033SRTpkzRtft8vpjsX9YSRis7hxMsAcQnWwYd7U9uZg04nDZtmt+x0+k0\nHAhqV0Y\/2V977bUWVKLfc6y6utqU8RorVqyQjh07yrhx40IeBO1wOCQnJ0fKysqkoaFB3n77bd0y\nCuFq06aN33E0vvAXLVoknTp10rWfOHEiLhYTNNrjC0Dis2XQ0X7YhrNGSCTef\/99v+OcnBxT7pso\njJbc1+7ubpYHHnhAkpKS\/NqWL18es\/utWLFCsrKy5Pbbb5cjR46E9J6srCxZuHChNDY2ymeffRbV\nnhFtT1q0ejb27Nkjqampuva9e\/fK1KlTo3KPlgo06D0e1\/0BEDpbBp2f\/OQnpt9z+fLl0tjY6Nem\n6u7YLWHUW5KcnGzpatHaXpFYDJx96qmnJDU1VW6\/\/faQenBcLpcUFhaKx+ORQ4cOxezvUNu2bWNy\nXbfbLdu3bzdcibioqMjSzT+NNjMVEXnvvfdMrgRANNky6HTp0sX0e2pX13U4HLrdy+1sxowZujbt\nOBmzjR071u9Y2yPXUl6vV8aNGycpKSkyY8aMkGb2uN1uWb58udTV1cnatWtjPkA7ltfPy8uTN998\n0\/Dc6NGjLZvSrf3zPqO5ndsBxDdbBh3t+INIB1qGQjug1KpBtvFqw4YNujbtvmRm027L0dDQIGVl\nZS2+3sKFCyU\/P1\/atWsnq1evbnaKeFpamowfP16qq6ulurpabrvtthbfO94UFhYarjhdX18v\/\/zP\n\/2xBRYEXpvzmm29MrgRANNky6GhDRiRTZ0Nh9NhKuzqy3X355Ze6tkWLFllQyf\/Ly8vzW0VbRMKe\nxfT444\/LwIEDJTU1VaZNmyYVFRVBx7u4XC4ZPXq0vPLKK1JbWyvFxcWmrgx9Nu3jpWj3tEycOFHm\nzJmja\/\/6669l8ODBcbNY3759+6wuAUAEbBl0tBs3akNItGm\/HHlspaftVTNavM0K2hWCN23aFPT1\n69atk4KCAsnIyBCHwyGPPvqolJeXN\/t4ql27dlJcXCx1dXXy+uuvWzYI+2za7RtiETweeeQRefTR\nR3XtO3bsMFy4MdbS0tJ0beHu8wUgvsTHt4nJtNNIY71WxieffOJ3nJ+fH9P7JRqv16sLm+3atbOo\nGn9XXHGF37F2K4TKykqZNm2atGvXTpxOp4wcOVK2bNkS0pdjmzZt5Oqrr5bq6mqpqqqKu6UGtAtr\ntmQbiFDMnj1brr76al37m2++aXrgM5qocOjQIVNrABBdtgw62p9MY\/noavbs2brVVa1+JBNvjKbv\nXnTRRRZUomc0SHrJkiXyxBNPSPfu3SU7O1sWLlwo1dXVIQXm9u3by4QJE+TgwYNSU1Mja9assezR\nVHO0qyPH8hHOmjVrpE+fPrr2VatWyWOPPRaz+2oZrefz3XffmXZ\/ANGX3PxL1KP9Yjl58mTM7qXd\npykzM5O9rTT+\/ve\/69pGjBhhQSV63bp1E6fT6dfjdO+994Z1jfbt28u4cePknnvukby8vGiXGDPa\nfydG46iiadu2bdK5c2fdlixz5syR7OxsueOOO2J6f5HTC1RqZ4Q1NjaKx+OJeBFGANawZY+O9gMr\nVrOuysrKdDM2Jk2aFJN7JTKjads\/\/elPLahEr6ysTDcguTlJSUnSt29feeyxx8Tn88nRo0flueee\nS6iQI6IPOvv374\/5\/datW2c4PuvOO+8MOCU9mgLNhpw\/f37M7w0gNmwZdLSPrmK1MrLRzKpwewPs\nwOgLVLvXktmmT58ubdq0kSFDhjQ7kNjlckmfPn3kwQcfFJ\/PJw0NDfLhhx\/q1k5KNNrByLEOOiIi\nBQUFsmbNGsNz1113Xcz3HCssLDRsj6dd1gGEx5ZBR\/uTaqxmVWzdutXv+Cc\/+YnpO3Engg8\/\/NDv\nWLv1glm8Xq\/ceOONkpycLP\/5n\/8ZdA+0M5tnbt68Werq6uSjjz6Sp59+2sRqY087IPzzzz835b6F\nhYXy5JNP6tobGhpk0KBBlkw7j5ep7gDCZ8ugoxXKyrThuvfee3WDU63aoDLeacdkGO2FFEsVFRVy\n\/fXXS\/v27eWVV17RDR43snPnTnn77beVHm91wQUX+B2HugdXNMycOdNwgcSqqioZNWpUTIOHy+XS\ntfl8Pva8AhIUQUdis47Of\/\/3f+va5s2bF\/X7qEA7RiolJcWU+xYXF8sFF1wg+fn58uqrrwb8e5Cc\nnKwLX9u3bzejREt17NjR7ziWg\/aNLF++XMaNG6drLy0tlf\/4j\/+I2X0D9bouXbo0ZvcEEDsEnRjY\nsmWL7rFHhw4d4nYacbyJ5Ro6FRUV8m\/\/9m\/SunVrmTBhguzatSvga9u0aSPz5s2T+vp6ufLKK\/3O\nvfXWWzGrMV7069fP77i5LStiYdWqVYbjZpYuXSozZ86MyT2HDx9u2L527dqY3A9AbBF0YuDWW2\/V\ntam0T1E0GT0OiMU+YBMnTpSMjAzJz8+XP\/3pT1JbW2v4OofDIbm5uVJaWio1NTVN6+hoF7Szw\/5H\n2llisV5YM5CVK1caDk6fN2+e\/Pa3v436\/R5++GHD9s8++yzq9wIQew6fVZ9eFtPu4xPN3wan0+l3\nPYfDEfNtJhKVx+ORnJwcv7Ybb7xRVq5cGfG1t2zZIrfddpt8+umnzb62Xbt2ct1118nTTz9t2PPm\n9Xqlbdu2Tcd9+vSRjz76KOIa410s\/52Ew+v1yqBBgwzDxpo1awxXVo5EWlqa4UKiNv24BBIaPTr\/\nEK3BjdOmTdN9GFq1G3Mi0O7qLmK8Om04VqxYIVlZWVJQUNBsyOnZs6c8\/\/zzUlVVJUuXLg34eNHt\ndvsNUv36668jqjFRaNcQqqiosKQOt9stf\/3rXw3Hb40aNSrqA4W128ScYcZaPgCii6DzD9FaS+f5\n55\/Xtb388stRubaKjH7fO3To0KJrPfTQQ3LOOefI7bff3mwQ6dGjh2zevFn2798vd999d0jXP\/fc\nc5v+P1b7PsWbVq1a+R3Has2pUGRnZ8uLL76oa\/f5fNK3b9+ozsQKtJ7OH\/\/4x6jdA4A5CDr\/EI31\nbUpKSuSHH37wa+vcuXPCrYhrtfPOO8+wffHixVJQUCBZWVmSkZEhrVq1krS0NMnMzBSn0ynz58\/X\nTVXX6tmzp+zevVs+\/fTTsKeGt2\/f3u\/YDj\/da3\/N2jWPzDZ+\/HjDNXZ+\/PFH6du3b9Tuc\/311xu2\nl5WVRe0eAMxB0ImiBx98UNdm1MOD\/2e0CF3Xrl2b\/n\/y5MmSlpYmDodDpkyZIlu2bJGvv\/5ajh8\/\nLidPnpQff\/xRampqgo6dcDgcMmzYMPF4PLJ\/\/\/4WB0\/tRqPaBSFV9E\/\/9E9+x80FSTPMnDnTcHDy\n4cOHZeDAgVHp2QkUgtngE0g8BJ0oWblypW5waocOHQJ2geM0o0chDodDBgwYIA6HQ\/7rv\/6rxbvL\nZ2RkyH333SeNjY2ycePGiHvtevTo4Xf8zjvvRHS9RKD9NR88eNCiSvxt3LjRb3D4GeXl5XLfffdF\nJewY7XHGpAIg8RB0omDKlCly880369odDof07NlTRowYITNmzJAPPvjAguri27Zt23RteXl5snv3\n7hZfs3fv3vLKK6\/IsWPHZPHixZGU50f7U74dphtrF0oMti2Gmdxut3z22WeGg5NffvnlqCwoGGg9\np7lz50Z8bQDmsWXQ0f60F+7u1GdLT0+XxYsXGz46OXLkiBw4cEDeeecdeeqppyQvL08cDod06tRJ\nFi9ezP45InLo0KGoXSs9PV08Ho98\/PHHcsMNN0TtumcUFBT4HdthQHJ2drbfcTytH+R2u2XDhg2G\nYWfp0qUyderUiK5\/yy23GLZv3LgxousCMBdBR4z3tglFTk6ObvBxKL766iuZMmWKtG\/fXi6++GJb\nB55oPQpxOByydetWUzdN1W5doaI2bdr4HZu1sWeohgwZIqtWrdKt9yMiUlRUJLNmzWrxtQMtHFhe\nXt7iawIwny2DjnatFO2HeagiXbujsbFRtm\/fLm3btpWkpCRJTU2VlJQUSUlJEZfLJZmZmdK1a1cZ\nMWKEvPXWW0oGomg9CikpKTFldpt2Z3UV\/0zOlp6e7nd89OhRiyoJbPTo0fLEE08Ynps7d26LHzW5\n3W7D3qKjR48q\/+cOqMSWQUf7U2laWlrY13j99dejVY6InA49dXV1Ul9fL\/X19dLQ0CA1NTXyxRdf\nyDvvvCOFhYXStm1bcblc0rt3bxkzZozMmjVLSkpKxOPxJOwHb6SDO51Op2zevFm3F1WsaP+uqL6j\ndUZGht9xS3owzTBz5kyZNGmS4blZs2bJsmXLWnTdXr16GbYvWbKkRdcDYL6WD05JYPv27fM7rqur\nC\/sazzzzTLTKCUtDQ4Ps379f9u\/fb3je5XJJq1atpG\/fvjJ06FCZPHmyqY9zwhVJ0OnYsaMcPnw4\nitU0LzMz02+K9UcffWQ41VkViRJ0RER+97vfyY4dO+T999\/XnbvzzjuldevWYY\/d6tWrl+zdu1fX\nvmTJkphtKgogumzZo6N9xh5og8dg7rvvvmiVE1X19fVSU1Mj27dvl6efflqys7PF5XJJdna2XHbZ\nZfLwww9LaWmp1WVG7J577jE95IjoZ+IcOXLE9BqsFO\/Tq3fs2BFwZe1bb71VNm3aFNb1rrnmGsP2\nL7\/8MuzaAFjDlkFH+wXZkg\/vULcNiAcNDQ1SWVkpW7dulSeffFKGDh0qDodDkpOTpWPHjjJ27FjL\nwo\/RINJgsrKyxOPxWPboQLtq886dOy2pwyza8WuJsKnl\/v37Dcfd1dXVyTXXXCO7du0K+Vpjxowx\nbPf5fJbt+wUgPLZ8dLVnzx6\/4\/r6+rDev3LlSjl+\/HjEdTgcDunXr5+MHz9esrKypKqqSg4cOCCV\nlZXyww8\/yDfffCOtWrUSl8sl7du3F5fLJQ6HQ2pqauTkyZNSVVUlX331lZw8ebJF9z916pQcOXJE\nXnvtNXnttdekoKDA9MATatDp3bu3vP3225Y\/huvUqZPfcTw\/yrErt9stn3\/+ufTs2VOqqqr8zp04\ncUKGDh0qFRUVuqnzga4VyJw5c2T16tUR1wsgtmwZdLQbPp46dSrk9xYXF8utt97a4nsnJSXJ+eef\nLzNnzozqWi8ej0fWrl0ra9askT179si3334bdoArKyuTTZs2ybBhw6JWV3OSk5ODTtPu0KGD7N+\/\nP+gXjpnstm9ZuD1u8cLtdsunn34qgwYN0i3sePz4cenZs6fs3LkzpD\/P1NRUw9W5jRa7BBB\/HL5E\n6IuOstatW\/uNy3G5XCENSL7jjjtk+fLlhucyMjKkQ4cOkpmZKbfccovU1tY23SMnJ0euu+46S76s\ni4uLZevWrbJhwwbZv39\/s2u\/LFy4UH7xi1+YVN3poKMNmvn5+TJ8+HBZuHChaXWEqqSkRK666qqm\n4+HDh8vf\/vY3CyuKLa\/Xq9tqobq6Om6CZ3O8Xq8MHz7c8HGVw+GQzZs36xaC1Lryyitl\/fr1uvZQ\nPzcAWMxnQ8nJyT4RafrP5XI1+57LLrvM7z3a\/zZu3GhC5ZHzeDy+kSNH+lJSUgx\/HeXl5abVsmzZ\nMsMaBg0aZFoN4Tp48KBfrbm5uVaXFFPV1dW6P5\/q6mqrywpLdXW17\/zzzzf8u+ZwOHyLFi0K+v7S\n0tKA\/+6Li4tN+lUAaClb9ug4nU6\/QZVpaWlBZ17dddddsnTp0qDXTMTfxqKiInn44Yebxhvdf\/\/9\n8uyzz5p2\/3bt2kl1dbXhuXj9\/fR4PJKTk9N0fPnll8vbb79tYUWxp318dfDgwZDGt8QTr9crnTp1\nCjim6oYbbpBXXnkl4Pu1nxlnpKenx83+XwCM2XLWlfYDq3Xr1gFf+9xzzzUbchJ1HMOUKVOkpqZG\nfD6f+Hw+U0OO1+sNGHJERB5\/\/HHTaglHdna2\/PSnP206vvfeey2sxhqJuDil2+2WvXv3Gq50LHL6\nEe8FF1wQ8NemXRH7jO+\/\/54ByUCcs13Qqays1LV17do14GtDWS\/H6bTdb2PEmluWv6ioyKRKU7Mk\niQAACjZJREFUwrdp0yYpLy+X6upqGT16tNXlxFwkm97Gk+zsbHnvvfcC\/nvdtWuXdO\/eXUpKSnTn\ngv0wY+aYNgDhs903tNHA0UAr2w4ePDika55zzjkR1WRHzfWSffvttyZV0jIDBgxImAG5kWrVqpXf\n8VdffWVRJZHLy8uTv\/\/97wHPV1dXy1VXXSUXXnihX3tqamrA9yTy7wdgB7YLOhs3btS1XXHFFbq2\n5cuXh7zq7b\/8y79EXJfdBHtsdcYHH3xgQiVojrYHZMeOHRZVEh0FBQVSUlIStCf2\/fffF6fT2dRj\nl5mZGfSaKqw2DqjKdkFHu6aGiMgll1yia5s4cWLI15w3b15ENdlRKION\/\/CHP5hQCZrjcrn8jrV7\nxSWikSNHSnl5ue7Xdjafzyd\/+ctfxOVySffu3YNeL5zPCwDmst2sqzZt2vjNkkhKStKtLRNo3Qwj\nycnJYS\/MZ3cVFRWSn5\/f7Ot69+4tH3\/8sQkVIRjt7Lh+\/fopEXZETg+szsnJicoA60RaXwiwE1v1\n6Nx88826qaBGz95DDTkiIj\/\/+c8jrstujHaXNsL2CvFB+7NQKI8dE4Xb7Zbq6mrp169fxNcaOXJk\nFCoCEG22CTqrV6+Wl156Sdeu\/TI1mpUViMPhkEWLFkVcm92Euu4IPWXxQdvjmYjTy5uzb98+mT59\nekTX2LZtW1zPFgTsyjZBZ8KECQHPnT2ddNWqVSFfc\/LkyRHVZFfh7C0G62n\/vFTd9mDBggWyefNm\nSU9Pb\/E1pk6dKrNnz45iVQAiZYugc+211wb9cj076Pzyl78M6Zr05sTed999Z3UJEJHGxsagxyoZ\nMmSI7Nmzp9nBx8H86le\/CqtnGEBsKR90Kisr5Y033gj6mi1btvgdB1o99WxjxoyJqC47e+2110J6\nXXMbkMIcRtOwVXx8dUZ2drYcOHAgomUjrrnmmihWBCASygedYcOGNfsa7eJ0za0TkpGRIa+++mpE\nddnZsWPHrC4BYTAKOnZY42jLli3y6KOPtui9zBYE4ofSQcfr9YrH42n2ddp9bHJzc6WiosJw6fvu\n3bvzRR2hUaNGhfS6YKvRwjxpaWm6tjMbwapu9uzZsmbNmrD3s2McGhA\/lA461157bUivO\/fcc3Vt\nubm5Ul9fLx6PR2655RaZP3+++Hw+OXDgQLTLtJ1QN+xksHd8MFobxmg\/KFVdffXVcvDgwbD2\/MrI\nyIhhRQDCoXTQKSsrC+l1\/fv3D3iuW7du8sILL4Q8SBmhaW4qb1pamixYsMCkahBMVlaWrm3v3r0W\nVGKdbt26yZEjR0Lu2bnttttiXBGAUCkbdEpLS0OeHcJ0UPMtWLAgYNjp3Lmz1NbWmlwRAjH6QeCb\nb76xoBJrud1u+dvf\/qZ71K3VsWNHeeaZZ0yqCkBzlA06kyZNCvm13bp1i2ElCGTBggXi8\/lk\/fr1\nkpubK9OnTxefzydffPGF1aXhLF26dNG12XXH7mHDhsnRo0dlzJgxhoFn6NChcvjwYQsqAxCIsntd\nhdrF3KVLF\/n8889jXA2QuEpLS2Xo0KF+bRkZGQzK\/4elS5dKmzZtZPz48VaXAsCA7YPOvHnzZMaM\nGTGuBkhsRv+edu\/eLXl5eRZUAwChU\/LR1RNPPBHyawk5QHCBZlj97Gc\/M7kSAAifrXt0HA6H0svZ\nA9Fw0UUXyXvvvWd47tlnn5X777\/f5IoAIHS2Djq9evWSTz75xIRqgMSVmpoacCNPl8ul7CafANSg\n5KMrkdAWpSPkAM0LFmTq6+vlueeeM7EaAAiPsj06IiL\/\/u\/\/LitXrtS1Jycny9q1a2XEiBEWVAUk\nDq\/XK23btg36muTkZKmvrzepIgAIj7I9OiIiL730kvh8PikoKJCMjAzp06eP3HTTTVJfX0\/IAULw\n+uuvN\/uahoaGkPaUAwArhL55SwIrLS21ugQgIZ04cSKk102cOFE2bNgQ42oAIHxK9+gAiIzRhrdG\ntm\/fHuNKAKBllB6jAyAyoYzREWGpBgDxi6ADIKhQVxnnowRAPOLRFYCgQg06l156aYwrAYDw0aMD\nIKikpKSQHkulpaVJbW2tCRUBQOjo0QEQVKg9OqyQDCAeEXQABNWjR4+QXte7d+8YVwIA4SPoAAiq\nqKgopNc9+eSTMa4EAMLHGB0AzerXr5989NFHAc\/37dtXPvzwQxMrAoDQ0KMDoFkffvhhwG1TRowY\nQcgBELcIOgBCsn79evH5fPKnP\/1JcnNz5fHHHxefzyfr16+3ujQACIhHVwAAQFn06AAAAGURdAAA\ngLIIOgAAQFkEHQAAoCyCDgAAUBZBBwAAKIugAwAAlEXQAQAAyiLoAAAAZRF0AACAsgg6AABAWQQd\nAACgLIIOAABQFkEHAAAoi6ADAACURdABAADKIugAAABlEXQAAICyCDoAAEBZBB0AAKAsgg4AAFAW\nQQcAACiLoAMAAJRF0AEAAMoi6AAAAGURdAAAgLIIOgAAQFkEHQAAoCyCDgAAUBZBBwAAKIugAwAA\nlEXQAQAAyiLoAAAAZRF0AACAsgg6AABAWQQdAACgLIIOAABQFkEHAAAoi6ADAACURdABAADKIugA\nAABlEXQAAICyCDoAAEBZBB0AAKAsgg4AAFAWQQcAACiLoAMAAJRF0AEAAMoi6AAAAGURdAAAgLII\nOgAAQFkEHQAAoCyCDgAAUBZBBwAAKIugAwAAlEXQAQAAyiLoAAAAZRF0AACAsgg6AABAWQQdAACg\nLIIOAABQFkEHAAAoi6ADAACURdABAADKIugAAABlEXQAAICyCDoAAEBZBB0AAKAsgg4AAFAWQQcA\nACiLoAMAAJRF0AEAAMoi6AAAAGURdAAAgLIIOgAAQFkEHQAAoCyCDgAAUBZBBwAAKIugAwAAlEXQ\nAQAAyiLoAAAAZRF0AACAsgg6AABAWQQdAACgLIIOAABQFkEHAAAoi6ADAACURdABAADKIugAAABl\nEXQAAICyCDoAAEBZBB0AAKAsgg4AAFAWQQcAACiLoAMAAJRF0AEAAMoi6AAAAGURdAAAgLIIOgAA\nQFkEHQAAoCyCDgAAUBZBBwAAKIugAwAAlEXQAQAAyiLoAAAAZRF0AACAsgg6AABAWQQdAACgLIIO\nAABQFkEHAAAoi6ADAACURdABAADKIugAAABlEXQAAICyCDoAAEBZBB0AAKAsgg4AAFAWQQcAACiL\noAMAAJRF0AEAAMoi6AAAAGURdAAAgLIIOgAAQFkEHQAAoCyCDgAAUBZBBwAAKIugAwAAlEXQAQAA\nyiLoAAAAZRF0AACAsgg6AABAWQQdAACgLIIOAABQFkEHAAAoi6ADAACURdABAADKIugAAABlEXQA\nAICyCDoAAEBZBB0AAKAsgg4AAFAWQQcAACiLoAMAAJRF0AEAAMoi6AAAAGURdAAAgLIIOgAAQFkE\nHQAAoCyCDgAAUBZBBwAAKIugAwAAlEXQAQAAyiLoAAAAZRF0AACAsgg6AABAWQQdAACgrP8DFFVd\nicTDXQYAAAAASUVORK5CYII=\n";
		$customerSignatureUrl = ConvertImage($customerSignature);
	}



	$CategoryID = 8; //Visit Action
	$query1 = "DELETE FROM t_transaction_dropdown where TransactionId=$TransactionId AND CategoryID=$CategoryID;";
	$resultdata1 = $db->query($query1);

	$errormsg = "";
	foreach ($SelfFBVisitActions as $key => $obj) {
		$DropDownListID = $obj->VisitActionID;
		$query2 = "INSERT INTO t_transaction_dropdown (TransactionId, DropDownListID, CategoryID) 
		VALUES ($TransactionId, $DropDownListID, $CategoryID);";
		$resultdata2 = $db->query($query2);

		if (is_object($resultdata2)) {
			$errormsg = $resultdata2->errorInfo;
		}
	}

	if ($errormsg != "") {
		$apiResponse = json_encode(recordNotFoundMsg(0, $errormsg));
		apiLogWrite("Output (" . date('Y_m_d_H_i_s') . "): " . $apiResponse);
		echo $apiResponse;
		return;
	}





	$query3 = "DELETE FROM t_transaction_machineparts where TransactionId=$TransactionId;";
	$resultdata3 = $db->query($query3);

	$errormsg = "";
	foreach ($SelfFBVisitMachineParts as $key => $obj) {
		$MachinePartsId = $obj->MachinePartsId;
		$PartsQuantity = $obj->PartsQuantity;
		$query4 = "INSERT INTO t_transaction_machineparts (TransactionId, MachinePartsId,Qty) 
		VALUES ($TransactionId, $MachinePartsId,$PartsQuantity);";
		$resultdata4 = $db->query($query4);

		if (is_object($resultdata4)) {
			$errormsg = $resultdata4->errorInfo;
		}
	}

	if ($errormsg != "") {
		$apiResponse = json_encode(recordNotFoundMsg(0, $errormsg));
		apiLogWrite("Output (" . date('Y_m_d_H_i_s') . "): " . $apiResponse);
		echo $apiResponse;
		return;
	}



	$query = "UPDATE t_transaction set ContactPersonName=:ContactPersonName,ContactPersonDesignation=:ContactPersonDesignation,
ContactPersonMobileNumber=:ContactPersonMobileNumber,SelfDiscussion=:SelfDiscussion,SelfFollowUpDate=:SelfFollowUpDate,IsVisitorFeedback=:IsVisitorFeedback
,customerBySuggestion=:customerBySuggestion
,customerSignature=:customerSignatureUrl
,customerToSuggestion=:customerToSuggestion
 where TransactionId=:TransactionId;";
	$pList = array(
		'ContactPersonName' => $ContactPersonName,
		'ContactPersonDesignation' => $ContactPersonDesignation,
		'ContactPersonMobileNumber' => $ContactPersonMobileNumber,
		'SelfDiscussion' => $SelfDiscussion,
		'SelfFollowUpDate' => $SelfFollowUpDate,
		'IsVisitorFeedback' => $IsVisitorFeedback,
		'TransactionId' => $TransactionId,
		'customerBySuggestion' => $customerBySuggestion,
		'customerSignatureUrl' => $customerSignatureUrl,
		'customerToSuggestion' => $customerToSuggestion
	);
	$db->bindMore($pList);
	$resultdata = $db->query($query);

	if (is_object($resultdata)) {
		$errormsg = $resultdata->errorInfo;
		$apiResponse = json_encode(recordNotFoundMsg(0, $errormsg[2]));
		apiLogWrite("Output (" . date('Y_m_d_H_i_s') . "): " . $apiResponse);
		echo $apiResponse;
	} else {

		$response = array(["SysValue" => 1, "SysMessage" => "Data has been saved successfully"]);
		$apiResponse = json_encode($response);
		echo $apiResponse;
		apiLogWrite("Output (" . date('Y_m_d_H_i_s') . "): " . $apiResponse);
	}
} catch (PDOException $e) {
	$apiResponse = json_encode(recordNotFoundMsg(0, $e->getMessage()));
	apiLogWrite("Output (" . date('Y_m_d_H_i_s') . "): " . $apiResponse);
	echo $apiResponse;
}




function ConvertImage($base64_string){
		
	$targetDir = '../../../image/transaction/';
	$exploded = explode(',', $base64_string, 2);
	$extention = explode(';', explode('/', $exploded[0])[1])[0];
	$decoded = base64_decode($exploded[1]);
	$output_file = date("Y_m_d_H_i_s_").rand(1,9999).".".$extention; /**Image file name */
	file_put_contents($targetDir."/".$output_file, $decoded);
	return $output_file;
}