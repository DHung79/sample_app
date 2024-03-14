import 'dart:convert';

import 'package:flutter/material.dart';
import '../../../apis/bank/bank.dart';
import '../../../apis/base/rest/rest_api_handler_data.dart';
import '../../../themes/theme_config.dart';

class BankScreen extends StatelessWidget {
  const BankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        children: [
          CustomButtonStyle.roundDark(
            color: Colors.amberAccent,
            onPressed: () {
              showBankList(context);
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Text(
                'get banks',
                style: CustomTextStyle.boldStandard(
                  color: TextColors.textWhite,
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          //   child: CustomButtonStyle.roundDark(
          //     color: Colors.amberAccent,
          //     onPressed: () {
          //       showBankList(context);
          //     },
          //     child: Padding(
          //       padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          //       child: Text(
          //         'get banks',
          //         style: CustomTextStyle.boldStandard(
          //           color: TextColors.textWhite,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  showBankList(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black12,
      builder: (BuildContext context) {
        return const AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
          contentPadding: EdgeInsets.zero,
          content: BankListView(),
        );
      },
    );
  }
}

class BankListView extends StatefulWidget {
  const BankListView({super.key});

  @override
  State<BankListView> createState() => _BankListViewState();
}

class _BankListViewState extends State<BankListView> {
  final _bankBloc = BankBloc();
  @override
  void initState() {
    _bankBloc.fetchAllData();
    super.initState();
  }

  @override
  void dispose() {
    _bankBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final dialogWidth = screenSize.width;
    return Container(
      constraints: BoxConstraints(
        minWidth: dialogWidth,
        maxWidth: dialogWidth,
      ),
      child: StreamBuilder(
        stream: _bankBloc.allData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final banks = snapshot.data!.model!.records;
            if (banks.isEmpty) {
              return Container();
            } else {
              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: banks.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 16,
                    );
                  },
                  itemBuilder: (context, index) {
                    final bank = banks[index];
                    return InkWell(
                      onTap: () {
                        lookUpBankAccount(bank);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [BoxShadowStyle.e01],
                          border: Border.all(
                            width: 1,
                            color: Colors.blueAccent,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                              child: Text(
                                bank.shortName,
                                style: CustomTextStyle.boldStandard(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                              child: Text(
                                bank.name,
                                style: CustomTextStyle.boldStandard(),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                bank.logo,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
          return Container();
        },
      ),
    );
  }

  Future lookUpBankAccount(BankModel bank) async {
    var path = 'https://api.vietqr.io/v2/lookup';
    logDebug('path: $path');
    final response = await RestApiHandlerData.postDynamic(
      path: path,
      headers: {
        'x-client-id': '567f43a9-ed16-4692-be66-0b31f8663a6d',
        'x-api-key': '76899456-a901-4908-8b14-3b663a408634',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        "bin": bank.bin,
        "accountNumber": 6011342547,
      }),
    );
    logDebug('lookUpBankAccount: $response');
    return response;
  }
}
