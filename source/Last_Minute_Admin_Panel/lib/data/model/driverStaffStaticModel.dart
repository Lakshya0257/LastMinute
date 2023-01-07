// ignore_for_file: prefer_typing_uninitialized_variables

class DriverStaffStaticModel {
  final driverName;
  final staffName;
  final ambulanceVehicleNo;
  final timeOfArrival;

  const DriverStaffStaticModel(
      {required this.driverName,
      required this.staffName,
      this.ambulanceVehicleNo,
      required this.timeOfArrival});

  static List<DriverStaffStaticModel> getStaticData() {
    return const [
      DriverStaffStaticModel(
        driverName: 'Lakshya Bhati',
        staffName: 'Devyanshu Gagneja',
        timeOfArrival: '8:20 Am',
      ),
      DriverStaffStaticModel(
        driverName: 'Aditya Singh',
        staffName: 'Pranjal Nema',
        timeOfArrival: '9:15 Pm',
      ),
      DriverStaffStaticModel(
        driverName: 'Harshdeep',
        staffName: 'Devyanshu Gagneja',
        timeOfArrival: '3:50 Pm',
      ),
      DriverStaffStaticModel(
        driverName: 'Pranjal Nema',
        staffName: 'Harshdeep',
        timeOfArrival: '1:20 Pm',
      ),
      DriverStaffStaticModel(
        driverName: 'Lakshya Bhati',
        staffName: 'Aditya Singh',
        timeOfArrival: '11:20 Pm',
      ),
    ];
  }
}
