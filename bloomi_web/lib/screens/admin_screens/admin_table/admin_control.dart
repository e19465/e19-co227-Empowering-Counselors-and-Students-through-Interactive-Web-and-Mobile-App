import 'package:bloomi_web/providers/user_home_provider/user_appoinment_provider.dart';
import 'package:bloomi_web/screens/admin_screens/registration%20_forms/adminform.dart';
import 'package:bloomi_web/utils/util_admin_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminControl extends StatefulWidget {
  const AdminControl({super.key});

  @override
  State<AdminControl> createState() => _AdminControlState();
}

class _AdminControlState extends State<AdminControl> {
  List<bool> isRowHovered = [];
  List<bool> isRowHoveredDeleted = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var width = mediaQueryData.size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<UserAppoinmentProvider>(
              builder: (context, value, child) {
                // Initialize the lists based on the length of allAdminModel
                isRowHovered =
                    List.generate(value.allAdminModel.length, (index) => false);
                isRowHoveredDeleted =
                    List.generate(value.allAdminModel.length, (index) => false);

                return Padding(
                    padding: const EdgeInsets.all(40),
                    child: Center(
                      child: DataTable(
                          sortColumnIndex: 0,
                          sortAscending: true,
                          dataRowMinHeight: 50,
                          dataRowMaxHeight: 50,
                          dataTextStyle: TextStyle(
                            color: Colors.grey.shade900,
                          ),
                          columnSpacing: (width * 1 / 15),
                          columns: [
                            AdminFunctions.customDataColumns('Name'),
                            AdminFunctions.customDataColumns('Email'),
                            AdminFunctions.customDataColumns('Contact Number'),
                            AdminFunctions.customDataColumns('Faculty'),
                            AdminFunctions.customDataColumns('Actions'),
                          ],
                          rows: List.generate(
                            value.allAdminModel.length,
                            (index) {
                              return DataRow(
                                cells: [
                                  AdminFunctions.customDatacells(
                                      value.allAdminModel[index].name),
                                  AdminFunctions.customDatacells(
                                      value.allAdminModel[index].email),
                                  AdminFunctions.customDatacells(
                                      value.allAdminModel[index].phone),
                                  AdminFunctions.customDatacells(value
                                      .allAdminModel[index].userCredential),
                                  DataCell(
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          MouseRegion(
                                            onEnter: (_) {
                                              setState(() {
                                                isRowHovered[index] = true;
                                              });
                                            },
                                            onExit: (_) {
                                              setState(() {
                                                isRowHovered[index] = false;
                                              });
                                            },
                                            child: ElevatedButton(
                                                onPressed: () =>
                                                    adminregistrationform(
                                                        context),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      isRowHovered[index]
                                                          ? Colors.greenAccent
                                                          : Colors.grey.shade50,
                                                ),
                                                child: Text(
                                                  'Update',
                                                  style: TextStyle(
                                                    color: isRowHovered[index]
                                                        ? Colors.black
                                                        : Colors
                                                            .purple.shade400,
                                                  ),
                                                )),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          MouseRegion(
                                            onEnter: (_) {
                                              setState(() {
                                                isRowHoveredDeleted[index] =
                                                    true;
                                              });
                                            },
                                            onExit: (_) {
                                              setState(() {
                                                isRowHoveredDeleted[index] =
                                                    false;
                                              });
                                            },
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    isRowHoveredDeleted[index]
                                                        ? Colors
                                                            .redAccent.shade200
                                                        : Colors.grey.shade50,
                                              ),
                                              child: Text(
                                                'Delete',
                                                style: TextStyle(
                                                  color:
                                                      isRowHoveredDeleted[index]
                                                          ? Colors.black
                                                          : Colors
                                                              .purple.shade400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          )),
                    ));
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 100.0),
                child: FloatingActionButton.extended(
                  onPressed: () => adminregistrationform(context),
                  label: const Icon(Icons.person_3),
                  icon: const Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
