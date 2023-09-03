import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  //String currency, int amount, String unit, Icon icon
  final String currency, amount, unit;
  final IconData icon;
  final bool isInverted;
  final double seq;
  final Color _blackColor = const Color(0xFF1F2123);

  const WalletCard({
    super.key,
    required this.currency,
    required this.amount,
    required this.unit,
    required this.icon,
    required this.isInverted,
    required this.seq,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -20 * seq),
      child: (Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: isInverted ? Colors.white : _blackColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currency,
                    style: TextStyle(
                        color: isInverted ? Colors.black : Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: isInverted ? Colors.black : Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        unit,
                        style: TextStyle(
                          color: isInverted
                              ? Colors.black.withOpacity(0.5)
                              : Colors.white.withOpacity(0.5),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Transform.scale(
                scale: 2.2,
                child: Transform.translate(
                  offset: const Offset(-5, 12),
                  child: Icon(
                    icon,
                    color: isInverted ? Colors.black : Colors.white,
                    size: 80,
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
