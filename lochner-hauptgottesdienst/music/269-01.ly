\version "2.24.3"
% Lochner, Luthers Weise. PDF scan 269, printed p. 244.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper {
  paper-width = 150\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \key c \major \accidentalStyle forget \omit Staff.TimeSignature \cadenzaOn }
\score {
  \new StaffGroup <<
    \new Staff <<
      \clef treble \global
      \new Voice = "melody" { r1 \bar "||" c''1 a'1 a'1 a'1 g'1 a'\breve a'\breve \bar "|" a'1 a'1 a'1 a'1 a'1 a'1 f'\breve g'\breve a'\breve }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t Un -- ser HErr JE -- sus Christ -- "(us)," in der "Nacht," da er ver -- ra -- then "ward," }
    \new PianoStaff <<
      \new Staff { \clef treble \global <g' c''>1\fermata~ \bar "||" <g' c''>1 <f' a'>1 r1 r1 <e' g'>1 <f' a'>\breve <f' g' a'>\breve \bar "|" r1 r1 r1 r1 r1 r1 <d' f'>\breve <d' g'>\breve <cis' a'>\breve }
      \new Staff { \clef bass \global <e c'>1_\fermata~ \bar "||" <e c'>1 <f c'>1 r1 r1 <c c'>1 <f c'>\breve <f c'>\breve \bar "|" r1 r1 r1 r1 r1 r1 <d a>\breve <bes, c d>\breve <a, e>\breve }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
