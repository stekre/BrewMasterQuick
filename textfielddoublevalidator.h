#ifndef TEXTFIELDDOUBLEVALIDATOR_H
#define TEXTFIELDDOUBLEVALIDATOR_H

#include <QValidator>

class TextFieldDoubleValidator : public QDoubleValidator
{
public:
    TextFieldDoubleValidator(QObject * parent = Q_NULLPTR);
    TextFieldDoubleValidator(double bottom, double top, int decimals, QObject * parent);
    QValidator::State validate(QString & s, int & pos) const;
};

#endif // TEXTFIELDDOUBLEVALIDATOR_H
