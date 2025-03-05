import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  final String date;
  final String type;
  final String totalExpense;
  final String? approvalStatus;
  final String? approvedBy;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? textColor;

  const ExpenseCard({
    super.key,
    required this.date,
    required this.type,
    required this.totalExpense,
    this.approvalStatus,
    this.approvedBy,
    this.primaryColor,
    this.secondaryColor = const Color(0xffF9FAFB),
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    // Determine card color and status based on approval
    Color cardColor = primaryColor ?? Colors.white;
    Color statusColor = _getStatusColor();
    Color defaultTextColor = textColor ?? Colors.black;

    return Card(
      // elevation: 4,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date
            const ListTile(
              leading: Icon(Icons.pages_outlined),
            ),
            Text(
              date,
              style: TextStyle(
                color: defaultTextColor.withOpacity(0.7),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),

            // Type and Total Expense Row
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.3),
                    width: 1,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Type',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        type,
                        style: TextStyle(
                          color: defaultTextColor,
                          // fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Expense',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        totalExpense,
                        style: TextStyle(
                          color: defaultTextColor,
                          // fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Approval Status (if applicable)
            if (approvalStatus != null) ...[
              const SizedBox(height: 8),
              // ListTile(
              //   contentPadding: EdgeInsets.zero,
              //   leading: Icon(
              //     _getStatusIcon(),
              //     color: statusColor,
              //     size: 20,
              //   ),
              //   title: Text(
              //     '$approvalStatus ${approvedBy != null ? 'by $approvedBy' : ''}',
              //     style: TextStyle(
              //       color: statusColor,
              //       fontSize: 14,
              //     ),
              //   ),
              //   trailing: const Text("By Elaine",),
              // )
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        _getStatusIcon(),
                        color: statusColor,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '$approvalStatus ${approvedBy != null ? 'by $approvedBy' : ''}',
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("By"),
                      Image.asset("assets/Frame.png"),
                      const Text("Elaine"),
                    ],
                  )
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getStatusColor() {
    switch (approvalStatus?.toLowerCase()) {
      case 'approved':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon() {
    switch (approvalStatus?.toLowerCase()) {
      case 'approved':
        return Icons.check_circle_sharp;
      case 'rejected':
        return Icons.check_circle_sharp;
      default:
        return Icons.help_outline;
    }
  }
}
