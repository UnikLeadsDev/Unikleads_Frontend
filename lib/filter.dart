import 'package:loan_application/colors.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String _selectedStatus = 'Paid';
  final List<String> _statuses = [
    'Paid',
    'Pending',
    'Failed',
    'Locked',
    'Rejected'
  ];
  bool _isStatusOpen = false;
  void _openStatusContainer() {
    setState(() {
      _isStatusOpen = !_isStatusOpen;
    });
  }

  void _selectStatus(String status) {
    setState(() {
      _selectedStatus = status;
    });
  }

  ///////////////////////// for time range//////////////////////////////////
  String _selectedTimeRange = 'Last Month';

  final List<String> _timeRange = [
    'This Week',
    'Last Week',
    'This Month',
    'Last Month'
  ];
  bool _isTimeRangeOpen = false;

  void _openTimeRangeContainer() {
    setState(() {
      _isTimeRangeOpen = !_isTimeRangeOpen;
    });
  }

  void _selectTimeRange(String timerange) {
    setState(() {
      _selectedTimeRange = timerange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/header_bg1.png',
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 190,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 42, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.popAndPushNamed(
                                context, '/mysalesdashboard'),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.arrow_back_ios,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                Text(
                                  'BACK',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Image.asset(
                                "assets/notification.png",
                                height: 40,
                                width: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Filter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  /////////////////////// Status //////////////////////////
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: _openStatusContainer,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Status',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(_isStatusOpen
                                    ? Icons.keyboard_arrow_up_outlined
                                    : Icons.keyboard_arrow_down_outlined),
                              ],
                            ),
                          ),
                        ),
                        if (_isStatusOpen)
                          Column(
                            children: [
                              const Divider(color: Colors.black12, height: 1),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  spacing: 10, // space horizontal
                                  runSpacing: 14, // rows vertical space
                                  children: _statuses.map((status) {
                                    bool isSelected = _selectedStatus == status;
                                    return GestureDetector(
                                      onTap: () {
                                        _selectStatus(status);
                                      },
                                      child: Container(
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    64) /
                                                2,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 8),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? const Color(0xFF1769E9)
                                              : const Color(0xffE8F0FD),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          status,
                                          style: TextStyle(
                                              color: isSelected
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),

                  /////////////////////// Time Range //////////////////////////
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: _openTimeRangeContainer,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Time Range',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(_isTimeRangeOpen
                                    ? Icons.keyboard_arrow_up_outlined
                                    : Icons.keyboard_arrow_down_outlined),
                              ],
                            ),
                          ),
                        ),
                        if (_isTimeRangeOpen)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Divider(color: Colors.black12, height: 1),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  spacing: 10, // space horizontal
                                  runSpacing: 14, // rows vertical space
                                  children: _timeRange.map((status) {
                                    bool isSelected =
                                        _selectedTimeRange == status;
                                    return GestureDetector(
                                      onTap: () {
                                        _selectTimeRange(status);
                                      },
                                      child: Container(
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    64) /
                                                2,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 8),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? const Color(0xFF1769E9)
                                              : const Color(0xffE8F0FD),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          status,
                                          style: TextStyle(
                                              color: isSelected
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text(
                                  "Custom Date",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const DatePickerField(),
                              const SizedBox(height: 20),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          textStyle: const TextStyle(fontSize: 18),
                          backgroundColor: const Color(0xffE8F0FD),
                          foregroundColor: const Color(0xFF1769E9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6))),
                      child: const Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text(
                          "CLEAR FILTER",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          textStyle: const TextStyle(fontSize: 18),
                          backgroundColor: const Color(0xFF1769E9),
                          foregroundColor: const Color(0xffE8F0FD),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6))),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          "APPLY",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DatePickerField extends StatefulWidget {
  const DatePickerField({super.key});

  @override
  DatePickerFieldState createState() => DatePickerFieldState();
}

class DatePickerFieldState extends State<DatePickerField> {
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: _dateController,
        decoration: InputDecoration(
          hintText: 'DD/MM/YYYY',
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              _selectDate(context);
            },
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12),
          ),
        ),
        readOnly: true,
        onTap: () {
          _selectDate(context);
        },
      ),
    );
  }
}
