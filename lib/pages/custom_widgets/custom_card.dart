import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget? leading;
  final String? title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final double elevation;
  final EdgeInsetsGeometry padding;
  final Color? color;
  final BorderRadiusGeometry borderRadius;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;

  const CustomCard({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.elevation = 2.0,
    this.padding = const EdgeInsets.all(12.0),
    this.color,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.titleMedium;
    final subtitleStyle =
        theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor);

    return Card(
      color: color ?? theme.cardColor,
      elevation: elevation,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      clipBehavior: Clip.antiAlias, // garante ripple dentro do raio
      child: InkWell(
        onTap: onTap,
        //borderRadius: Border.//borderRadius,
        child: Padding(
          padding: padding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (leading != null) ...[
                SizedBox(width: 48, height: 48, child: leading),
                const SizedBox(width: 12),
              ],
              // Conteúdo principal
              Expanded(
                child: Column(
                  crossAxisAlignment: crossAxisAlignment!,
                  mainAxisAlignment: mainAxisAlignment!,
                  children: [
                    if (title != null)
                      Text(
                        title!,
                        style: titleStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle!,
                        style: subtitleStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
              if (trailing != null) ...[
                const SizedBox(width: 8),
                trailing!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
