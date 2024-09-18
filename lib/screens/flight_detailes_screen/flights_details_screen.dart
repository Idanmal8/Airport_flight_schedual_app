import 'package:ben_gurion_flights/model/flights_status_enum/flights_status_enum.dart';
import 'package:ben_gurion_flights/screens/flight_detailes_screen/viewModel/flight_details_screen_view_model.dart';
import 'package:ben_gurion_flights/screens/flight_detailes_screen/widgets/date_card.dart';
import 'package:ben_gurion_flights/screens/flight_detailes_screen/widgets/flight_card.dart';
import 'package:ben_gurion_flights/screens/flight_detailes_screen/widgets/font_size_buttons.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlightsDetailsScreen extends StatelessWidget {
  const FlightsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        backgroundColor: const Color(0xff191966),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (context) => FlightDetailsScreenViewModel(),
        child: Consumer<FlightDetailsScreenViewModel>(
          builder: (context, viewModel, _) {
            return Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Stack(
                    clipBehavior: Clip.antiAlias,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: const Color(0xff191966),
                              child: Image.asset('assets/World Map.png'),
                            ),
                          ),
                        ],
                      ),
                      Center(
                          child: Image.asset('assets/Plane Illustration.png')),
                      const Center(
                          child: Text('לוח טיסות',
                              style: TextStyle(
                                  fontSize: 35, color: Colors.white))),
                    ],
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  FontSizeButtons(
                                    title: '+',
                                    onTap: () {
                                      viewModel.increaseFontSize();
                                    },
                                  ),
                                  FontSizeButtons(
                                    title: '-',
                                    onTap: () {
                                      viewModel.decreaseFontSize();
                                    },
                                  ),
                                ],
                              ),
                               Row(
                                children: [
                                  DateCard(
                                    title: 'מחר',
                                    isSelected: viewModel.isTommorow,
                                    onTap: viewModel.getTommorowFlights,
                                  ),
                                  DateCard(
                                    title: 'היום',
                                    isSelected: viewModel.isToday,
                                    onTap: viewModel.getTodayFlights,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  'טרמינל',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: viewModel.flightTitls),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'זמן עדכני',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: viewModel.flightTitls),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'מספר טיסה',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: viewModel.flightTitls),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        viewModel.isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Expanded(
                                child: ListView.builder(
                                  itemCount: viewModel.flightsList.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      alignment: Alignment
                                          .center, // Align the whole container to the center
                                      height: 180,
                                      width: 400,
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Image.asset(
                                              scale: 0.9,
                                              'assets/Bg.png',
                                              fit: BoxFit
                                                  .cover, // Ensure the image fits the container
                                            ),
                                          ),
                                          Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center, // Center the column
                                              children: [
                                                SizedBox(
                                                  width: 350,
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize
                                                        .min, // Keep Row size minimal
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      // Terminal
                                                      Expanded(
                                                        flex: 4,
                                                        child: Text(
                                                          viewModel
                                                              .flightsList[
                                                                  index]
                                                              .terminal,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: viewModel
                                                                  .flightInfo),
                                                        ),
                                                      ),

                                                      Expanded(
                                                        flex: 4,
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                                (viewModel
                                                                    .flightsList[
                                                                        index]
                                                                    .updatedTime == '' ? viewModel.flightsList[index].scheduledTime : viewModel.flightsList[index].updatedTime) ?? '',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        viewModel
                                                                            .flightInfo)),
                                                            Text(
                                                                viewModel
                                                                    .flightsList[
                                                                        index]
                                                                    .scheduledDate,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        viewModel
                                                                            .flightInfo)),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              viewModel
                                                                  .flightsList[
                                                                      index]
                                                                  .flight,
                                                              style: TextStyle(
                                                                  color: const Color(
                                                                      0xffF2C21A),
                                                                  fontSize:
                                                                      viewModel
                                                                          .flightInfo),
                                                            ),
                                                            Text(
                                                              viewModel
                                                                  .flightsList[
                                                                      index]
                                                                  .city,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      viewModel
                                                                          .flightInfo),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 20),
                                                SizedBox(
                                                  width: 350,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Chip(
                                                        side: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 0,
                                                        ),
                                                        color: WidgetStatePropertyAll(
                                                            FlightStatusExtension
                                                                    .fromString(viewModel
                                                                        .flightsList[
                                                                            index]
                                                                        .status)
                                                                .color),
                                                        label: SizedBox(
                                                          width: 50,
                                                          child: Text(
                                                            viewModel
                                                                .flightsList[
                                                                    index]
                                                                .status,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'סטטוס',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors
                                                                .grey[400]),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
