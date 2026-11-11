\version "2.24.3"
% Scan 181, printed p. 156: Epistelton, opening through Nun sucht man ... Haushaltern.
#(set-global-staff-size 17)
\header { tagline = ##f }
\paper { paper-width = 100\mm paper-height = 155\mm top-margin = 0\mm bottom-margin = 0\mm left-margin = 0\mm right-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
 <<
  \new Staff { \new Voice = "melody" { \clef treble \key g \major \cadenzaOn \override Stem.stencil = ##f
    \override Score.SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 1)
    d'1 g'1 g'1 g'1 g'1 b'1 a'1 a'1 g'1 g'\breve \bar "|"
    d'1 d'1 g'1 g'\breve \bar "|" \break
    g'1 g'1 g'1 e'1 e'1 g'1 g'\breve \bar "|"
    g'1 g'\breve g'1 g'1 fis'1 a'1 g'\breve \bar "|" \break
    g'1 g'1 g'1 g'1 
    g'1 g'1 b'1 a'1 a'1 a'1 g'\breve \bar "|" \break
    d'1 g'1 g'1 g'1 g'1 g'1 e'1 e'1 g'1 g'1 \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar "," } }
  \new Lyrics \lyricsto "melody" { So schreibt Sanct "Pau :" lus an die "Co :" "rin :" "ther."
    "Lie :" ben "Brü :" "der,"
    "da :" für halt uns "Je :" "der :" "mann,"
    "näm :" "lich" für "Chri :" stus "Die :" "ner,"
    und "Haus :" "hal :" ter
    "ü :" ber "Got :" tes "Ge :" "heim :" niß.
    Nun sucht man nicht mehr an den "Haus :" "hal :" tern, }
 >>
 \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-3 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } }
}
